import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:qunzo_merchant/l10n/app_localizations.dart';
import 'package:qunzo_merchant/src/common/model/user_profile_model.dart';
import 'package:qunzo_merchant/src/helper/toast_helper.dart';
import 'package:qunzo_merchant/src/network/api/api_path.dart';
import 'package:qunzo_merchant/src/network/response/status.dart';
import 'package:qunzo_merchant/src/network/service/network_service.dart';

class UserProfileController extends GetxController {
  AppLocalizations? get _localization {
    final context = Get.context ?? Get.overlayContext;
    if (context == null) return null;
    return AppLocalizations.of(context);
  }

  // Global Variable
  final RxBool isLoading = false.obs;

  // User Profile Data
  final Rx<UserProfileModel> userProfileModel = UserProfileModel().obs;

  Future<void> loadUserProfile() async {
    isLoading.value = true;
    await fetchUserProfile();
    isLoading.value = false;
  }

  // Fetch User Profile Function
  Future<void> fetchUserProfile() async {
    try {
      final response = await Get.find<NetworkService>().get(
        endpoint: ApiPath.getUserProfileEndpoint,
      );
      if (response.status == Status.completed) {
        userProfileModel.value = UserProfileModel.fromJson(response.data!);
      }
    } catch (e, stackTrace) {
      debugPrint('❌ fetchUserProfile() error: $e');
      debugPrint('📍 StackTrace: $stackTrace');
      ToastHelper().showErrorToast(_localization!.allControllerGeneralError);
    } finally {}
  }
}
