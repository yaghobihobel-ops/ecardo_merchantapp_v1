import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx hide Response;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:qunzo_merchant/l10n/app_localizations.dart';
import 'package:qunzo_merchant/src/app/constants/app_colors.dart';
import 'package:qunzo_merchant/src/app/constants/assets_path/png_assets.dart';
import 'package:qunzo_merchant/src/app/routes/routes.dart';
import 'package:qunzo_merchant/src/common/services/kyc_error_handler.dart';
import 'package:qunzo_merchant/src/common/widgets/button/common_button.dart';
import 'package:qunzo_merchant/src/helper/toast_helper.dart';
import 'package:qunzo_merchant/src/network/api/api_path.dart';
import 'package:qunzo_merchant/src/network/response/api_response.dart';
import 'package:qunzo_merchant/src/network/service/token_service.dart';

class NetworkService extends getx.GetxService {
  // Properties
  final Dio _dio = Dio();
  final Dio _globalDio = Dio();
  final String baseUrl = ApiPath.baseUrl;
  late TokenService _tokenService;

  // v1.0.2: real app version for X-App-Version (never hardcoded).
  String _appVersion = '';

  // v1.0.2 (S-023): in-flight Idempotency-Key registry keyed by
  // "METHOD:path?query:payload-fingerprint" so a genuine double-tap of the
  // same logical money operation reuses one key while two different
  // concurrent operations never share one.
  final Map<String, String> _inflightIdempotency = {};

  // v1.0.2: merchant money POSTs that the backend guards with the
  // `idempotency` middleware (routes/api/merchant.php).
  static const List<String> _idempotentEndpointSuffixes = [
    '/merchant/withdraw',
    '/merchant/exchange',
  ];

  // v1.0.2: time-based dedupe so parallel 401s surface the re-login dialog
  // exactly once instead of stacking dialogs on top of each other.
  static DateTime? _lastUnauthorizedDialogAt;

  AppLocalizations? get localization {
    final ctx = getx.Get.context;
    if (ctx == null) return null;
    return AppLocalizations.of(ctx);
  }

  // Lifecycle Methods
  @override
  void onInit() {
    super.onInit();
    _tokenService = getx.Get.find<TokenService>();
    _resolveAppVersion();
    _configureHttpClient();
    _configureGlobalHttpClient();
  }

  Future<void> _resolveAppVersion() async {
    try {
      final info = await PackageInfo.fromPlatform();
      _appVersion = info.version;
      if (kDebugMode) {
        debugPrint('📱 X-App-Version resolved: $_appVersion');
      }
    } catch (_) {
      _appVersion = '';
    }
  }

  // Config for secured dio
  void _configureHttpClient() {
    _dio.options.baseUrl = baseUrl;
    _dio.options.contentType = 'application/json';
    _dio.options.headers['Accept'] = 'application/json';
    // v1.0.2: without timeouts Dio defaults to infinite — a hung server would
    // freeze the request (and the calling screen) forever.
    _dio.options.connectTimeout = const Duration(seconds: 15);
    _dio.options.receiveTimeout = const Duration(seconds: 30);
    _dio.options.sendTimeout = const Duration(seconds: 30);
    _setupInterceptors();
  }

  // Config for global dio
  void _configureGlobalHttpClient() {
    _globalDio.options.baseUrl = baseUrl;
    _globalDio.options.contentType = 'application/json';
    _globalDio.options.headers['Accept'] = 'application/json';
    _globalDio.options.connectTimeout = const Duration(seconds: 15);
    _globalDio.options.receiveTimeout = const Duration(seconds: 30);
    _globalDio.options.sendTimeout = const Duration(seconds: 30);
    _globalDio.interceptors.clear();
  }

  // Setup Interceptor
  void _setupInterceptors() {
    _dio.interceptors.clear();
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          String? accessToken = _tokenService.accessToken.value;
          if (kDebugMode) {
            _log(
              '🔑 Token: ${accessToken == null || accessToken.isEmpty ? '<none>' : '<redacted ${accessToken.length} chars>'}',
            );
          }

          if (accessToken != null && accessToken.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $accessToken';
          }

          // v1.0.2: request ID for server-side traceability (meta.request_id).
          options.headers['X-Request-ID'] =
              options.headers['X-Request-ID'] ?? _generateRequestId();

          if (_appVersion.isNotEmpty) {
            options.headers['X-App-Version'] = _appVersion;
          }
          options.headers['X-Client'] = 'ecardo_merchant_flutter';

          // v1.0.2 (S-023): money POSTs carry Idempotency-Key. The key is
          // reused across an in-flight logical call so a double submission
          // maps to the same idempotency key server-side.
          if (options.method.toUpperCase() == 'POST' &&
              options.headers['Idempotency-Key'] == null) {
            final path = options.uri.path;
            final isMoney = _idempotentEndpointSuffixes.any(
              (suffix) => path.endsWith(suffix),
            );
            if (isMoney) {
              final mapKey =
                  'POST:$path?${options.uri.query}:${_payloadFingerprint(options.data)}';
              options.headers['Idempotency-Key'] =
                  _inflightIdempotency.putIfAbsent(mapKey, () {
                final minted = options.headers['X-Request-ID'] as String?;
                return minted ?? _generateRequestId();
              });
            }
          }

          // v1.0.2: platform identification for server analytics.
          if (kIsWeb) {
            options.headers['X-Platform'] = 'web';
          } else {
            options.headers['X-Platform'] = defaultTargetPlatform ==
                    TargetPlatform.android
                ? 'android'
                : defaultTargetPlatform == TargetPlatform.iOS
                    ? 'ios'
                    : 'unknown';
          }

          return handler.next(options);
        },
        onResponse: (response, handler) {
          _releaseIdempotencyKey(response.requestOptions);
          return handler.next(response);
        },
        onError: (DioException error, handler) async {
          _releaseIdempotencyKey(error.requestOptions);
          if (error.response?.statusCode == 401) {
            _log('401 Unauthorized — session must be re-established.');
          }

          // v1.0.3 (KYC-ERR): unified KYC block contract — 403
          // KYC_LEVEL_REQUIRED / KYC_FEATURE_REQUIRED route the user to the
          // UpgradeRequiredScreen (instead of a raw 403 toast) and 503
          // KYC_CHECK_UNAVAILABLE surfaces a retry message without ever
          // logging out or clearing the token. Flagged on requestOptions so
          // the shared 403/503 branches below stay in sync.
          final kycBlock = KycErrorHandler.parse(
            error.response?.data,
            statusCode: error.response?.statusCode,
          );
          if (kycBlock != null) {
            error.requestOptions.extra[KycErrorHandler.handledExtraKey] = true;
            await KycErrorHandler.handle(kycBlock);
          }

          return handler.next(error);
        },
      ),
    );
  }

  /// Frees the in-flight idempotency key once the logical operation settles
  /// (success or terminal failure), so the next operation mints a fresh key.
  void _releaseIdempotencyKey(RequestOptions options) {
    final headerKey = options.headers['Idempotency-Key'];
    if (headerKey == null) return;
    final mapKey =
        '${options.method.toUpperCase()}:${options.uri.path}?${options.uri.query}:${_payloadFingerprint(options.data)}';
    if (_inflightIdempotency[mapKey] == headerKey) {
      _inflightIdempotency.remove(mapKey);
    }
  }

  String _payloadFingerprint(Object? data) {
    if (data == null) return 'empty';
    if (data is FormData) return 'fd:${data.boundary}';
    try {
      return 'j:${jsonEncode(data).hashCode.toRadixString(36)}';
    } catch (_) {
      return 'raw:${data.hashCode}';
    }
  }

  /// Cryptographically random, unguessable request ID.
  String _generateRequestId() {
    final rnd = Random.secure();
    final bytes = List<int>.generate(12, (_) => rnd.nextInt(256));
    return 'req-${base64UrlEncode(bytes).replaceAll('=', '').toLowerCase()}';
  }

  // ------------------------------ AUTH CALLS ------------------------------ //

  // Login POST Method
  Future<ApiResponse<Map<String, dynamic>>> login({
    required String email,
    required String password,
  }) async {
    String url = '${_dio.options.baseUrl}${ApiPath.loginEndpoint}';

    _log('📤 Login POST Request URL: $url');
    // v1.0.2: never log the password — only the (non-secret) email.
    _log('📦 Login POST Request Body: {"email": $email, "password": "<redacted>"}');

    try {
      final response = await _dio.post(
        ApiPath.loginEndpoint,
        data: {'email': email, 'password': password},
      );

      _log('✅ Login POST Status Code: ${response.statusCode}');
      // v1.0.2: the response carries the bearer token — do not log it raw.
      _log('✅ Login POST Response: <received, token not logged>');

      if (response.statusCode == 200) {
        String accessToken = response.data["data"]["token"];
        await _tokenService.clearToken();
        await _tokenService.saveAccessToken(accessToken);
        _log('🔑 Token Saved Successfully');
        return ApiResponse.completed(response.data);
      }

      return ApiResponse.error('Login failed.');
    } on DioException catch (e) {
      return _handleDioException(e, "Login POST");
    } catch (e) {
      _log('Login POST Exception: ${e.toString()}', icon: '❌');
      ToastHelper().showErrorToast(
        localization?.networkServiceUnexpectedError ??
            'An unexpected error occurred. Please try again.',
      );
      return ApiResponse.error(e.toString());
    }
  }

  // Register POST Method
  Future<ApiResponse<Map<String, dynamic>>> register({
    required Map<String, dynamic> data,
  }) async {
    String url = '${_dio.options.baseUrl}${ApiPath.registerEndpoint}';
    final stopwatch = Stopwatch()..start();

    _log('📤 Register POST Request URL: $url');
    _log('📦 Register POST Request Body: ${jsonEncode(data)}');

    try {
      final response = await _dio.post(
        ApiPath.registerEndpoint,
        data: jsonEncode(data),
      );

      stopwatch.stop();
      _log('✅ Register Status Code: ${response.statusCode}');
      _log('✅ Register Response: <received>');
      _log('⏱️ Register Time: ${stopwatch.elapsedMilliseconds}ms');

      if (response.statusCode == 200) {
        String accessToken = response.data["data"]['token'];
        await _tokenService.saveAccessToken(accessToken);
        _log('🔑 Token Saved Successfully');
        return ApiResponse.completed(response.data);
      }

      return ApiResponse.error('Register failed.');
    } on DioException catch (e) {
      stopwatch.stop();
      _log('⏱️ Register Time: ${stopwatch.elapsedMilliseconds}ms');
      return _handleDioException(e, "Register");
    } catch (e) {
      stopwatch.stop();
      _log('⏱️ Register Time: ${stopwatch.elapsedMilliseconds}ms');
      _log('Register Exception: ${e.toString()}', icon: '❌');
      ToastHelper().showErrorToast(
        localization?.networkServiceUnexpectedError ??
            'An unexpected error occurred. Please try again.',
      );
      return ApiResponse.error(e.toString());
    }
  }

  // ----------------------------- SECURED API ------------------------------ //

  Future<ApiResponse<Map<String, dynamic>>> get({
    required String endpoint,
  }) async {
    String url = '${_dio.options.baseUrl}$endpoint';
    _log('📥 GET Request URL: $url');

    try {
      final response = await _dio.get(endpoint);
      return _handleResponse(response, "GET");
    } on DioException catch (e) {
      return _handleDioException(e, "GET");
    } catch (e) {
      _log('GET Exception: ${e.toString()}', icon: '❌');
      ToastHelper().showErrorToast(
        localization?.networkServiceUnexpectedError ??
            'An unexpected error occurred. Please try again.',
      );
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse<Map<String, dynamic>>> post({
    required String endpoint,
    Map<String, dynamic>? data,
  }) async {
    String url = '${_dio.options.baseUrl}$endpoint';
    _log('📤 POST Request URL: $url');

    if (data != null) {
      _log('📦 POST Request Body: ${jsonEncode(data)}');
    } else {
      _log('📦 POST Request Body: No body data');
    }

    try {
      final response = await _dio.post(
        endpoint,
        data: data != null ? jsonEncode(data) : null,
      );

      return _handleResponse(response, "POST");
    } on DioException catch (e) {
      return _handleDioException(e, "POST");
    } catch (e) {
      _log('POST Exception: ${e.toString()}', icon: '❌');
      ToastHelper().showErrorToast(
        localization?.networkServiceUnexpectedError ??
            'An unexpected error occurred. Please try again.',
      );
      return ApiResponse.error(e.toString());
    }
  }

  /// v1.0.2: multipart upload path. Plain [post] jsonEncodes the payload,
  /// which silently corrupts FormData — uploads (KYC documents, profile
  /// images, ticket attachments) MUST go through this method.
  ///
  /// Dio auto-sets `Content-Type: multipart/form-data` with the boundary.
  ///
  /// ```dart
  /// final formData = FormData();
  /// formData.files.add(MapEntry('documents[govt_id]',
  ///     await MultipartFile.fromFile(file.path, filename: file.name)));
  /// final response = await networkService.postMultipart(
  ///   endpoint: ApiPath.kycLevelSubmitEndpoint,
  ///   data: formData,
  /// );
  /// ```
  Future<ApiResponse<Map<String, dynamic>>> postMultipart({
    required String endpoint,
    required FormData data,
  }) async {
    String url = '${_dio.options.baseUrl}$endpoint';
    _log('📤 POST (multipart) Request URL: $url');
    _log(
      '📦 POST (multipart) Fields: ${data.fields.length}, Files: ${data.files.length}',
    );

    try {
      final response = await _dio.post(endpoint, data: data);
      return _handleResponse(response, "POST (multipart)");
    } on DioException catch (e) {
      return _handleDioException(e, "POST (multipart)");
    } catch (e) {
      _log('POST (multipart) Exception: ${e.toString()}', icon: '❌');
      ToastHelper().showErrorToast(
        localization?.networkServiceUnexpectedError ??
            'An unexpected error occurred. Please try again.',
      );
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse<Map<String, dynamic>>> delete({
    required String endpoint,
    Map<String, dynamic>? data,
  }) async {
    String url = '${_dio.options.baseUrl}$endpoint';
    _log('🗑️ DELETE Request URL: $url');

    if (data != null) {
      _log('📦 DELETE Request Body: ${jsonEncode(data)}');
    } else {
      _log('📦 DELETE Request Body: No body data');
    }

    try {
      final response = await _dio.delete(
        endpoint,
        data: data != null ? jsonEncode(data) : null,
      );

      return _handleResponse(response, "DELETE");
    } on DioException catch (e) {
      return _handleDioException(e, "DELETE");
    } catch (e) {
      _log('DELETE Exception: ${e.toString()}', icon: '❌');
      ToastHelper().showErrorToast(
        localization?.networkServiceUnexpectedError ??
            'An unexpected error occurred. Please try again.',
      );
      return ApiResponse.error(e.toString());
    }
  }

  // ------------------------------ GLOBAL API ------------------------------ //

  Future<ApiResponse<Map<String, dynamic>>> globalPost({
    required String endpoint,
    Map<String, dynamic>? data,
  }) async {
    try {
      String url = '$baseUrl$endpoint';
      _log('Global POST Request URL: $url', icon: '✅');

      if (data != null) {
        _log('📦 Global POST Request Body: ${jsonEncode(data)}');
      } else {
        _log('📦 Global POST Request Body: No body data');
      }

      final response = await _globalDio.post(
        url,
        data: data != null ? jsonEncode(data) : null,
        options: Options(headers: _baseHeaders),
      );

      return _handleResponse(response, "Global POST");
    } on DioException catch (e) {
      return _handleDioException(e, "Global POST");
    } catch (e) {
      _log('Global POST Exception: ${e.toString()}', icon: '❌');
      ToastHelper().showErrorToast(
        localization?.networkServiceUnexpectedError ??
            'An unexpected error occurred. Please try again.',
      );
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse<Map<String, dynamic>>> globalGet({
    required String endpoint,
  }) async {
    try {
      String url = '$baseUrl$endpoint';
      _log('Global GET Request URL: $url', icon: '✅');

      final response = await _globalDio.get(
        url,
        options: Options(headers: _baseHeaders),
      );

      return _handleResponse(response, "Global GET");
    } on DioException catch (e) {
      return _handleDioException(e, "Global GET");
    } catch (e) {
      _log('Global GET Exception: ${e.toString()}', icon: '❌');
      ToastHelper().showErrorToast(
        localization?.networkServiceUnexpectedError ??
            'An unexpected error occurred. Please try again.',
      );
      return ApiResponse.error(e.toString());
    }
  }

  // ------------------------------- HANDLERS ------------------------------- //

  ApiResponse<Map<String, dynamic>> _handleDioException(
    DioException e,
    String requestType,
  ) {
    // Detect No Internet Connection
    if (e.type == DioExceptionType.connectionError ||
        (e.type == DioExceptionType.unknown &&
            e.error.toString().contains('SocketException'))) {
      _log('$requestType No Internet Connection', icon: '🚫');
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (getx.Get.currentRoute != BaseRoute.noInternetConnection) {
          getx.Get.offAllNamed(BaseRoute.noInternetConnection);
        }
      });
      return ApiResponse.error('No internet connection');
    }

    // v1.0.2: these now actually fire because both Dio instances carry
    // explicit timeouts (previously Dio's infinite defaults made this
    // branch dead code).
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      _log('$requestType TimeoutException: Request timed out', icon: '⏳');
      ToastHelper().showErrorToast(
        localization?.networkServiceTimeout ?? 'Request timed out',
      );
      return ApiResponse.error('Request timed out');
    }

    // Server returned a response
    if (e.response != null) {
      return _handleDioErrorResponse(e.response!, requestType);
    }

    // Generic error
    _log('$requestType DioException: ${e.message}', icon: '🚫');
    ToastHelper().showErrorToast(
      localization?.networkServiceGenericError ?? 'An error occurred',
    );
    return ApiResponse.error(e.message ?? 'An error occurred');
  }

  ApiResponse<Map<String, dynamic>> _handleResponse(
    Response response,
    String requestType,
  ) {
    _log('Handling Response - Status Code: ${response.statusCode}', icon: '📥');

    switch (response.statusCode) {
      case 200:
      case 201:
        final jsonData = response.data as Map<String, dynamic>;
        _log('$requestType Response: OK', icon: '✅');
        return ApiResponse.completed(jsonData);
      default:
        _log('Unknown Status Code: ${response.statusCode}', icon: '❓');
        return ApiResponse.error('Error occurred: ${response.statusCode}');
    }
  }

  ApiResponse<Map<String, dynamic>> _handleDioErrorResponse(
    Response response,
    String requestType,
  ) {
    _log(
      'Handling Error Response - Status Code: ${response.statusCode}',
      icon: '⚠️',
    );

    switch (response.statusCode) {
      case 400:
        final jsonResponse = response.data as Map<String, dynamic>? ?? {};
        _log('$requestType Response: ${jsonResponse.toString()}', icon: '❌');
        final errorMessages = jsonResponse['message'] as String? ?? "";
        ToastHelper().showErrorToast(errorMessages);
        return ApiResponse.error(errorMessages);
      case 401:
        final jsonResponse = response.data as Map<String, dynamic>? ?? {};
        _log('$requestType Response: ${jsonResponse.toString()}', icon: '❌');
        final errorMessages = jsonResponse['message'] as String? ?? "";
        _showUnauthorizedDialogOnce();
        ToastHelper().showErrorToast(errorMessages);
        return ApiResponse.error(errorMessages);

      case 403:
      case 404:
      case 422:
      case 500:
        final jsonResponse = response.data as Map<String, dynamic>? ?? {};
        _log('$requestType Response: ${jsonResponse.toString()}', icon: '❌');
        final errorMessages = jsonResponse['message'] as String? ?? "";
        // v1.0.3 (KYC-ERR): a KYC block was already routed to the
        // UpgradeRequiredScreen by the interceptor — suppress the raw toast.
        if (!_isKycBlockHandled(response) && errorMessages.isNotEmpty) {
          ToastHelper().showErrorToast(errorMessages);
        }
        return ApiResponse.error(errorMessages);

      case 503:
        final jsonResponse = response.data as Map<String, dynamic>? ?? {};
        _log('$requestType Response: ${jsonResponse.toString()}', icon: '❌');
        final errorMessages = jsonResponse['message'] as String? ?? "";
        // v1.0.3 (KYC-ERR): KYC_CHECK_UNAVAILABLE is a transient outage —
        // show a retry toast and NEVER take over the screen (no maintenance
        // redirect), matching the server contract.
        if (_isKycBlockHandled(response)) {
          ToastHelper().showErrorToast(
            localization?.kycCheckUnavailable ??
                'Verification check is temporarily unavailable. '
                    'Please try again shortly.',
          );
          return ApiResponse.error(errorMessages);
        }
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (getx.Get.currentRoute != BaseRoute.maintenanceMode) {
            getx.Get.offAllNamed(BaseRoute.maintenanceMode);
          }
        });
        return ApiResponse.error(errorMessages);

      default:
        _log('Unknown Error: ${response.statusCode}', icon: '❓');
        ToastHelper().showErrorToast(
          localization?.networkServiceGenericError ?? 'An error occurred',
        );
        return ApiResponse.error('Error occurred: ${response.statusCode}');
    }
  }

  /// v1.0.3 (KYC-ERR): true when the Dio interceptor already handled this
  /// response as a KYC block (routed to upgrade screen / retry toast).
  bool _isKycBlockHandled(Response response) {
    return response.requestOptions.extra[KycErrorHandler.handledExtraKey]
        is bool;
  }

  /// v1.0.2: the re-login dialog is shown at most once every 3 seconds.
  /// Previously N parallel requests hitting 401 stacked N modal dialogs —
  /// only the topmost one was dismissable and the app appeared frozen.
  void _showUnauthorizedDialogOnce() {
    final now = DateTime.now();
    if (_lastUnauthorizedDialogAt != null &&
        now.difference(_lastUnauthorizedDialogAt!) < const Duration(seconds: 3)) {
      return;
    }
    if (getx.Get.currentRoute == BaseRoute.login) return;
    _lastUnauthorizedDialogAt = now;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (getx.Get.currentRoute == BaseRoute.login) return;
      getx.Get.dialog(
        PopScope(
          canPop: false,
          child: Dialog(
            insetPadding: EdgeInsets.zero,
            backgroundColor: AppColors.lightPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: SizedBox(
              width: 324,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.all(15),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(52),
                        color: AppColors.error.withValues(alpha: 0.10),
                      ),
                      child: Image.asset(
                        PngAssets.commonAlertIcon,
                        width: 30,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Column(
                      children: [
                        Text(
                          localization?.networkServiceUnauthorizedText ??
                              'Session Expired',
                          style: TextStyle(
                            letterSpacing: 0,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: AppColors.lightTextPrimary,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          textAlign: TextAlign.center,
                          localization?.networkServiceUnauthorizedMessage ??
                              'Please login again to continue.',
                          style: TextStyle(
                            letterSpacing: 0,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColors.lightTextPrimary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    CommonButton(
                      borderRadius: 8,
                      width: 60,
                      height: 35,
                      text: localization?.networkServiceOkText ?? 'OK',
                      onPressed: () => getx.Get.offAllNamed(BaseRoute.login),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  // ---------------------- UTILS ----------------------

  Map<String, String> get _baseHeaders {
    return {'Content-Type': 'application/json', 'Accept': 'application/json'};
  }

  void _log(String message, {String icon = '📄'}) {
    if (kDebugMode) {
      debugPrint('$icon $message');
    }
  }
}
