// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get comment_common_maintenance => '==== Maintenance ====';

  @override
  String get maintenanceTitle => 'تحت الصيانة';

  @override
  String get maintenanceSubtitle =>
      'نقوم حاليًا بإجراء صيانة مجدولة لتحسين تجربتك.';

  @override
  String get comment_all_controller => '==== All Controller Error Message ====';

  @override
  String get allControllerGeneralError => 'حدث خطأ ما!';

  @override
  String get comment_exit_app_message => '==== Exit App Message ====';

  @override
  String get exitAppTitle => 'الخروج من التطبيق';

  @override
  String get exitAppMessage => 'هل أنت متأكد أنك تريد الخروج من التطبيق؟';

  @override
  String get comment_splash_screen => '==== Splash Screen ====';

  @override
  String get splashMerchant => 'تاجر';

  @override
  String get comment_navigation_screen => '==== Navigation Screen ====';

  @override
  String get navigationHome => 'الرئيسية';

  @override
  String get navigationWallets => 'المحافظ';

  @override
  String get navigationProfile => 'الملف الشخصي';

  @override
  String get navigationSetting => 'الإعدادات';

  @override
  String get comment_image_picker_controller =>
      '==== Image Picker Controller ====';

  @override
  String get imagePickerGalleryError => 'فشل اختيار الصورة من المعرض';

  @override
  String get imagePickerCameraError => 'فشل التقاط الصورة من الكاميرا';

  @override
  String get comment_biometric_auth_service =>
      '==== Biometric Auth Service ====';

  @override
  String get biometricDeviceNotSupported =>
      'هذا الجهاز لا يدعم التحقق البيومتري.';

  @override
  String get biometricNoEnrolled =>
      'لا يوجد بصمة مسجلة. يرجى إعداد بصمة الإصبع';

  @override
  String get biometricUnavailable =>
      'ميزات التحقق البيومتري غير متوفرة حالياً.';

  @override
  String get biometricAuthenticationFailed => 'فشل التحقق البيومتري.';

  @override
  String get biometricCheckFailed => 'تعذر التحقق من توفر التحقق البيومتري.';

  @override
  String get biometricAuthenticateReason => 'التحقق لتسجيل الدخول';

  @override
  String get comment_network_service => '==== Network Service ====';

  @override
  String get networkServiceUnexpectedError =>
      'حدث خطأ غير متوقع. حاول مرة أخرى.';

  @override
  String get networkServiceTimeout => 'انتهت مهلة الطلب. حاول مرة أخرى.';

  @override
  String get networkServiceGenericError => 'حدث خطأ. حاول مرة أخرى.';

  @override
  String get networkServiceUnauthorizedText => 'غير مصرح';

  @override
  String get networkServiceOkText => 'موافق';

  @override
  String get networkServiceUnauthorizedMessage =>
      'غير مصرح لك بالوصول إلى هذا المورد. يرجى تسجيل الدخول مرة أخرى!';

  @override
  String get comment_api_access_key_screen => '==== API Access Key Screen ====';

  @override
  String get apiAccessKeyTitle => 'مفتاح الوصول API';

  @override
  String get apiAccessKeyPublicKeyLabel => 'المفتاح العام';

  @override
  String get apiAccessKeySecretKeyLabel => 'المفتاح السري';

  @override
  String get apiAccessKeyPublicKeyCopied => 'تم نسخ المفتاح العام';

  @override
  String get apiAccessKeySecretKeyCopied => 'تم نسخ المفتاح السري';

  @override
  String get apiAccessKeyRegenerateButton => 'إعادة إنشاء';

  @override
  String get apiAccessKeyGenerateAlertTitle => 'إنشاء مفتاح وصول API جديد';

  @override
  String get apiAccessKeyGenerateAlertMessage =>
      'هل أنت متأكد أنك تريد إنشاء مفتاح وصول API جديد؟';

  @override
  String get comment_forgot_password_screen =>
      '==== Forgot Password Screen ====';

  @override
  String get forgotPasswordTitle => 'نسيت كلمة المرور';

  @override
  String get forgotPasswordEmailLabel => 'البريد الإلكتروني';

  @override
  String get forgotPasswordEmailRequired => 'حقل البريد الإلكتروني مطلوب';

  @override
  String get forgotPasswordSendButton => 'إرسال رمز التحقق';

  @override
  String get forgotPasswordGoBackButton => 'رجوع';

  @override
  String get comment_reset_password_screen => '==== Reset Password Screen ====';

  @override
  String get resetPasswordTitle => 'إعادة تعيين كلمة المرور';

  @override
  String get resetPasswordPasswordLabel => 'كلمة المرور';

  @override
  String get resetPasswordConfirmPasswordLabel => 'تأكيد كلمة المرور';

  @override
  String get resetPasswordPasswordRequired => 'كلمة المرور مطلوبة';

  @override
  String get resetPasswordPasswordLength =>
      'كلمة المرور يجب أن تكون 8 أحرف على الأقل';

  @override
  String get resetPasswordConfirmPasswordRequired => 'يرجى تأكيد كلمة المرور';

  @override
  String get resetPasswordPasswordsDontMatch => 'كلمتا المرور غير متطابقتين';

  @override
  String get resetPasswordButton => 'إعادة تعيين';

  @override
  String get resetPasswordAlreadyHaveAccount => 'لديك حساب بالفعل؟ ';

  @override
  String get resetPasswordLoginLink => 'تسجيل الدخول';

  @override
  String get comment_forgot_password_pin_verification_screen =>
      '==== Forgot Password Pin Verification Screen ====';

  @override
  String get forgotPasswordPinVerificationTitle => 'تحقق من رمز التحقق';

  @override
  String get forgotPasswordPinVerificationEnterOtp => 'أدخل رمز التحقق';

  @override
  String get forgotPasswordPinVerificationOtpSentTo =>
      'تم إرسال رمز التحقق إلى';

  @override
  String forgotPasswordPinVerificationOtpCountdown(Object countdown) {
    return 'رمز التحقق خلال 00:$countdown';
  }

  @override
  String get forgotPasswordPinVerificationOtpRequired => 'حقل رمز التحقق مطلوب';

  @override
  String get forgotPasswordPinVerificationVerifyButton => 'تحقق من الرمز';

  @override
  String get forgotPasswordPinVerificationDidNotReceive => 'لم تستلم الرمز؟ ';

  @override
  String get forgotPasswordPinVerificationResend => 'إعادة إرسال';

  @override
  String get comment_login_screen => '==== Login Screen ====';

  @override
  String get loginTitle => 'تسجيل دخول التاجر';

  @override
  String get loginEmailLabel => 'البريد الإلكتروني';

  @override
  String get loginPasswordLabel => 'كلمة المرور';

  @override
  String get loginEmailRequired => 'حقل البريد الإلكتروني مطلوب';

  @override
  String get loginPasswordRequired => 'حقل كلمة المرور مطلوب';

  @override
  String get loginForgotPassword => 'نسيت كلمة المرور';

  @override
  String get loginButton => 'تسجيل الدخول';

  @override
  String get loginDontHaveAccount => 'ليس لديك حساب؟ ';

  @override
  String get loginCreateAccount => 'إنشاء حساب';

  @override
  String get loginFirstSignInRequired =>
      'أول تسجيل دخول باستخدام البريد الإلكتروني وكلمة المرور';

  @override
  String get loginBiometricNotEnabled => 'التحقق البيومتري غير مفعل';

  @override
  String get comment_two_factor_auth_screen =>
      '==== Two Factor Auth Screen ====';

  @override
  String get twoFactorAuthTitle => 'التحقق بخطوتين';

  @override
  String get twoFactorAuthEnterOtp => 'أدخل رمز التحقق';

  @override
  String get twoFactorAuthOtpRequired => 'حقل رمز التحقق مطلوب';

  @override
  String get twoFactorAuthVerifyButton => 'تحقق';

  @override
  String get twoFactorAuthBackToLogin => 'العودة إلى؟ ';

  @override
  String get twoFactorAuthLoginLink => 'تسجيل الدخول';

  @override
  String get comment_auth_id_verification_screen =>
      '==== Auth ID Verification Screen ====';

  @override
  String get authIdVerificationInvalidType => 'نوع الحقل غير صالح';

  @override
  String authIdVerificationUnknownType(Object fieldType) {
    return 'نوع حقل غير معروف: $fieldType';
  }

  @override
  String get comment_email_screen => '==== Email Screen ====';

  @override
  String get emailTitle => 'تسجيل التاجر';

  @override
  String get emailLabel => 'البريد الإلكتروني';

  @override
  String get emailRequired => 'يرجى إدخال البريد الإلكتروني';

  @override
  String get emailContinueButton => 'متابعة';

  @override
  String get emailAlreadyHaveAccount => 'لديك حساب بالفعل؟ ';

  @override
  String get emailLoginLink => 'تسجيل الدخول';

  @override
  String get comment_personal_info_screen => '==== Personal Info Screen ====';

  @override
  String get personalInfoTitle => 'تسجيل التاجر';

  @override
  String get personalInfoSectionTitle => 'المعلومات الأساسية';

  @override
  String get personalInfoFirstNameLabel => 'الاسم الأول';

  @override
  String get personalInfoLastNameLabel => 'الاسم الأخير';

  @override
  String get personalInfoUsernameLabel => 'اسم المستخدم';

  @override
  String get personalInfoCountryLabel => 'البلد';

  @override
  String get personalInfoPhoneLabel => 'رقم الهاتف';

  @override
  String get personalInfoGenderLabel => 'الجنس';

  @override
  String get personalInfoSubmitButton => 'إرسال';

  @override
  String get personalInfoFirstNameRequired => 'الاسم الأول مطلوب';

  @override
  String get personalInfoLastNameRequired => 'الاسم الأخير مطلوب';

  @override
  String get personalInfoUsernameRequired => 'اسم المستخدم مطلوب';

  @override
  String get personalInfoCountryRequired => 'البلد مطلوب';

  @override
  String get personalInfoPhoneRequired => 'رقم الهاتف مطلوب';

  @override
  String get personalInfoGenderRequired => 'الجنس مطلوب';

  @override
  String get personalInfoSelectCountryTitle => 'اختر البلد';

  @override
  String get personalInfoSelectGenderTitle => 'اختر الجنس';

  @override
  String get personalInfoCountryNotFound => 'لا توجد بلد';

  @override
  String get personalInfoGenderNotFound => 'لا يوجد جنس';

  @override
  String get comment_set_up_password_screen =>
      '==== Set Up Password Screen ====';

  @override
  String get setUpPasswordTitle => 'تسجيل التاجر';

  @override
  String get setUpPasswordSectionTitle => 'إعداد كلمة المرور';

  @override
  String get setUpPasswordPasswordLabel => 'كلمة المرور';

  @override
  String get setUpPasswordConfirmPasswordLabel => 'تأكيد كلمة المرور';

  @override
  String get setUpPasswordAgreementText => 'أوافق على ';

  @override
  String get setUpPasswordTermsLink => 'الشروط والأحكام';

  @override
  String get setUpPasswordSetupButton => 'إعداد كلمة المرور';

  @override
  String get setUpPasswordPasswordRequired => 'كلمة المرور مطلوبة';

  @override
  String get setUpPasswordPasswordLength =>
      'كلمة المرور يجب أن تكون 8 أحرف على الأقل';

  @override
  String get setUpPasswordConfirmPasswordRequired => 'يرجى تأكيد كلمة المرور';

  @override
  String get setUpPasswordPasswordsDontMatch => 'كلمتا المرور غير متطابقتين';

  @override
  String get setUpPasswordAcceptTerms => 'يرجى الموافقة على الشروط والأحكام';

  @override
  String get comment_sign_up_status_screen => '==== Sign Up Status Screen ====';

  @override
  String get signUpStatusCurrentStatusTitle => 'الحالة الحالية';

  @override
  String get signUpStatusSetupNextStepTitle => 'لنقم بإعداد خطوتك التالية';

  @override
  String get signUpStatusStepEmail => 'البريد الإلكتروني';

  @override
  String get signUpStatusStepSetupPassword => 'إعداد كلمة المرور';

  @override
  String get signUpStatusStepPersonalInfo => 'المعلومات الشخصية';

  @override
  String get signUpStatusStepIdVerification => 'التحقق من الهوية';

  @override
  String get signUpStatusStatusInReview => 'قيد المراجعة';

  @override
  String get signUpStatusStatusRejected => 'مرفوض';

  @override
  String get signUpStatusNoReasonProvided => 'لم يتم تقديم سبب';

  @override
  String get signUpStatusNextButton => 'التالي';

  @override
  String get signUpStatusSubmitAgainButton => 'إرسال مرة أخرى';

  @override
  String get signUpStatusDashboardButton => 'لوحة التحكم';

  @override
  String get signUpStatusBackButton => 'رجوع';

  @override
  String get signUpStatusErrorProcessingStep =>
      'خطأ في معالجة الخطوة التالية. حاول مرة أخرى.';

  @override
  String get comment_verify_email_screen => '==== Verify Email Screen ====';

  @override
  String get verifyEmailMerchantRegisterTitle => 'تسجيل التاجر';

  @override
  String get verifyEmailVerifyEmailTitle => 'تحقق البريد الإلكتروني';

  @override
  String get verifyEmailOtpSentTo => 'تم إرسال رمز التحقق إلى';

  @override
  String get verifyEmailResendAvailableIn => 'يمكن إعادة الإرسال بعد';

  @override
  String get verifyEmailRequestNewOtp => 'يمكنك طلب رمز تحقق جديد الآن';

  @override
  String get verifyEmailContinueButton => 'متابعة';

  @override
  String get verifyEmailOtpRequiredError => 'حقل رمز التحقق مطلوب';

  @override
  String get verifyEmailDidntReceiveCode => 'لم تستلم الرمز؟ ';

  @override
  String get verifyEmailResendText => 'إعادة إرسال';

  @override
  String get comment_welcome_screen => '==== Welcome Screen ====';

  @override
  String get welcomeTitle => 'مرحباً بك في التاجر';

  @override
  String get welcomeSubtitle => 'إدارة المدفوعات، تتبع المبيعات، وتنمية أعمالك';

  @override
  String get welcomeCreateAccountButton => 'إنشاء حساب';

  @override
  String get welcomeLoginButton => 'تسجيل الدخول';

  @override
  String get welcomeExitApplicationTitle => 'الخروج من التطبيق';

  @override
  String get welcomeExitApplicationMessage =>
      'هل أنت متأكد أنك تريد الخروج من التطبيق؟';

  @override
  String get comment_change_password_controller =>
      '==== Change Password Controller Messages ====';

  @override
  String get changePasswordCurrentPasswordRequired =>
      'يرجى إدخال كلمة المرور الحالية';

  @override
  String get changePasswordNewPasswordRequired => 'يرجى إدخال كلمة مرور جديدة';

  @override
  String get changePasswordPasswordLength =>
      'كلمة المرور يجب أن تكون 8 أحرف على الأقل';

  @override
  String get changePasswordConfirmPasswordRequired =>
      'يرجى تأكيد كلمة المرور الجديدة';

  @override
  String get changePasswordPasswordsDontMatch => 'كلمتا المرور غير متطابقتين';

  @override
  String get comment_change_password_screen =>
      '==== Change Password Screen ====';

  @override
  String get changePasswordScreenTitle => 'تغيير كلمة المرور';

  @override
  String get changePasswordCurrentPasswordLabel => 'كلمة المرور الحالية';

  @override
  String get changePasswordNewPasswordLabel => 'كلمة المرور الجديدة';

  @override
  String get changePasswordConfirmPasswordLabel => 'تأكيد كلمة المرور';

  @override
  String get changePasswordSaveChangesButton => 'حفظ التغييرات';

  @override
  String get comment_exchange_controller =>
      '==== Exchange Controller Messages ====';

  @override
  String get exchangeSelectFromWalletError => 'يرجى اختيار محفظة المصدر';

  @override
  String get exchangeSelectToWalletError => 'يرجى اختيار محفظة الوجهة';

  @override
  String get exchangeEnterAmountError => 'يرجى إدخال المبلغ';

  @override
  String get exchangeMinAmountError => 'الحد الأدنى للمبلغ يجب أن يكون';

  @override
  String get exchangeMaxAmountError => 'الحد الأقصى للمبلغ يجب أن يكون';

  @override
  String get comment_exchange_screen => '==== Exchange Screen ====';

  @override
  String get exchangeScreenTitle => 'تبديل';

  @override
  String get comment_exchange_amount_step_section =>
      '==== Exchange Amount Step Section ====';

  @override
  String get exchangeFromWalletLabel => 'من محفظة';

  @override
  String get exchangeSelectFromWalletTitle => 'اختر محفظة المصدر';

  @override
  String get exchangeFromWalletsNotFound => 'محافظ المصدر غير موجودة';

  @override
  String get exchangeToWalletLabel => 'إلى محفظة';

  @override
  String get exchangeSelectToWalletTitle => 'اختر محفظة الوجهة';

  @override
  String get exchangeToWalletsNotFound => 'محافظ الوجهة غير موجودة';

  @override
  String get exchangeAmountLabel => 'المبلغ';

  @override
  String exchangeMinMaxLabel(Object currency, Object max, Object min) {
    return 'الحد الأدنى $min $currency والحد الأقصى $max $currency';
  }

  @override
  String get exchangeRateLabel => 'سعر الصرف:';

  @override
  String get exchangeButton => 'تبديل';

  @override
  String get comment_exchange_review_step_section =>
      '==== Exchange Review Step Section ====';

  @override
  String get exchangeReviewTitle => 'مراجعة التبديل';

  @override
  String get exchangeReviewAmount => 'المبلغ';

  @override
  String get exchangeReviewFromWallet => 'من محفظة';

  @override
  String get exchangeReviewCharge => 'الرسوم';

  @override
  String get exchangeReviewTotalAmount => 'المبلغ الإجمالي';

  @override
  String get exchangeReviewToWallet => 'إلى محفظة';

  @override
  String get exchangeReviewExchangeRate => 'سعر الصرف';

  @override
  String get exchangeReviewExchangeAmount => 'مبلغ التبديل';

  @override
  String get exchangeReviewExchangeNowButton => 'تبديل الآن';

  @override
  String get comment_exchange_success_step_section =>
      '==== Exchange Success Step Section ====';

  @override
  String get exchangeSuccessTitle => 'تم التبديل بنجاح';

  @override
  String get exchangeSuccessSubtitle => 'تمت عملية التبديل بنجاح';

  @override
  String get exchangeSuccessAmount => 'المبلغ';

  @override
  String get exchangeSuccessTransactionId => 'رقم المعاملة';

  @override
  String get exchangeSuccessConvertedAmount => 'المبلغ المحول';

  @override
  String get exchangeSuccessCharge => 'الرسوم';

  @override
  String get exchangeSuccessDate => 'التاريخ';

  @override
  String get exchangeSuccessFinalAmount => 'المبلغ النهائي';

  @override
  String get exchangeSuccessBackHomeButton => 'العودة للرئيسية';

  @override
  String get exchangeSuccessExchangeAgainButton => 'تبديل مرة أخرى';

  @override
  String get comment_home_controller => '==== Home Controller Messages ====';

  @override
  String get homeBiometricNotSupported =>
      'هذا الجهاز لا يدعم التحقق البيومتري.';

  @override
  String get homeBiometricEnabledSuccess => 'تم تفعيل التحقق البيومتري بنجاح';

  @override
  String get homeBiometricDisabledSuccess => 'تم تعطيل التحقق البيومتري بنجاح';

  @override
  String get homeBiometricAuthFailed =>
      'فشل التحقق. لم يتم تغيير إعداد التحقق البيومتري.';

  @override
  String get homeBiometricNotFoundTitle => 'التحقق البيومتري غير موجود';

  @override
  String get homeBiometricNotFoundMessage =>
      'لا توجد بصمة أو تحقق بيومتري مسجل على هذا الجهاز. يمكنك إعداده من إعدادات النظام.';

  @override
  String get homeOpenSecuritySettingsButton => 'فتح إعدادات الأمان';

  @override
  String get homeIosBiometricMessage =>
      'يرجى الذهاب إلى الإعدادات > Face ID & Passcode لإعداد التحقق البيومتري.';

  @override
  String get comment_drawer_section => '==== Drawer Section ====';

  @override
  String get drawerDashboard => 'لوحة التحكم';

  @override
  String get drawerMyWallets => 'محافظي';

  @override
  String get drawerQrCode => 'رمز QR';

  @override
  String get drawerExchange => 'تبديل';

  @override
  String get drawerApiAccessKey => 'مفتاح الوصول API';

  @override
  String get drawerTransactions => 'المعاملات';

  @override
  String get drawerWithdraw => 'سحب';

  @override
  String get drawerInvoice => 'فاتورة';

  @override
  String get drawerNotifications => 'الإشعارات';

  @override
  String get drawerSupportTicket => 'تذكرة الدعم';

  @override
  String get comment_home_header_section => '==== Home Header Section ====';

  @override
  String get homeHeaderAccountNumberCopied => 'تم نسخ رقم الحساب';

  @override
  String get homeHeaderMerchantIdPrefix => 'معرف التاجر:';

  @override
  String get comment_home_section_navigator =>
      '==== Home Section Navigator ====';

  @override
  String get homeViewAll => 'عرض الكل';

  @override
  String get comment_home_transaction_details =>
      '==== Home Transaction Details ====';

  @override
  String get transactionDetailsTitle => 'تفاصيل المعاملة';

  @override
  String get transactionDescription => 'الوصف';

  @override
  String get transactionWallet => 'المحفظة';

  @override
  String get transactionCharge => 'الرسوم';

  @override
  String get transactionTransactionId => 'رقم المعاملة';

  @override
  String get transactionMethod => 'الطريقة';

  @override
  String get transactionTotalAmount => 'المبلغ الإجمالي';

  @override
  String get transactionStatus => 'الحالة';

  @override
  String get comment_home_transactions_section =>
      '==== Home Transactions Section ====';

  @override
  String get homeRecentTransactions => 'أحدث المعاملات';

  @override
  String get comment_home_wallets_section => '==== Home Wallets Section ====';

  @override
  String get homeMyWallets => 'محافظي';

  @override
  String get homeNoWalletsFound => 'لا توجد محافظ';

  @override
  String get homeWalletWithdrawButton => 'سحب';

  @override
  String get comment_settings_bottom_sheet => '==== Settings Bottom Sheet ====';

  @override
  String get settingsProfileSetting => 'إعدادات الملف الشخصي';

  @override
  String get settingsChangePassword => 'تغيير كلمة المرور';

  @override
  String get settingsIdVerification => 'التحقق من الهوية';

  @override
  String get settingsTwoFa => 'التحقق بخطوتين';

  @override
  String get settingsSupport => 'الدعم';

  @override
  String get settingsLogout => 'تسجيل الخروج';

  @override
  String get comment_kyc_details_bottom_sheet =>
      '==== KYC Details Bottom Sheet ====';

  @override
  String get kycDetailsTitle => 'تفاصيل التحقق';

  @override
  String get kycDetailsStatusLabel => 'الحالة:';

  @override
  String get kycDetailsStatusPending => 'قيد الانتظار';

  @override
  String get kycDetailsStatusApproved => 'تمت الموافقة';

  @override
  String get kycDetailsStatusRejected => 'مرفوض';

  @override
  String get kycDetailsCreatedAtLabel => 'تاريخ الإنشاء:';

  @override
  String get kycDetailsMessageFromAdmin => 'رسالة من الإدارة:';

  @override
  String get kycDetailsSubmittedData => 'البيانات المقدمة';

  @override
  String get comment_kyc_history_screen => '==== KYC History Screen ====';

  @override
  String get kycHistoryTitle => 'سجل التحقق';

  @override
  String get kycHistoryDateLabel => 'التاريخ:';

  @override
  String get kycHistoryStatusLabel => 'الحالة: ';

  @override
  String get kycHistoryStatusPending => 'قيد الانتظار';

  @override
  String get kycHistoryStatusApproved => 'تمت الموافقة';

  @override
  String get kycHistoryStatusRejected => 'مرفوض';

  @override
  String get kycHistoryViewButton => 'عرض';

  @override
  String get comment_id_verification_screen =>
      '==== ID Verification Screen ====';

  @override
  String get idVerificationTitle => 'التحقق من الهوية';

  @override
  String get idVerificationHistory => 'السجل';

  @override
  String get idVerificationVerificationCenter => 'مركز التحقق';

  @override
  String get idVerificationNothingToSubmit => 'لا يوجد شيء لتقديمه';

  @override
  String get idVerificationStatus1Message =>
      'لقد قدمت مستنداتك وتم التحقق منها';

  @override
  String get idVerificationStatus2Message =>
      'لقد قدمت مستنداتك وهي في انتظار الموافقة';

  @override
  String get idVerificationStatus3Message =>
      'فشل التحقق من KYC الخاص بك. يرجى إعادة تقديم المستندات.';

  @override
  String get idVerificationStatus4Message => 'لم تقم بتقديم أي مستندات KYC بعد';

  @override
  String get comment_create_invoice_controller =>
      '==== Create Invoice Controller Messages ====';

  @override
  String get createInvoiceInvoiceToRequired => 'يرجى إدخال المستلم';

  @override
  String get createInvoiceEmailRequired => 'يرجى إدخال البريد الإلكتروني';

  @override
  String get createInvoiceAddressRequired => 'يرجى إدخال العنوان';

  @override
  String get createInvoiceWalletRequired => 'يرجى اختيار محفظة';

  @override
  String get createInvoiceStatusRequired => 'يرجى اختيار الحالة';

  @override
  String get createInvoiceIssueDateRequired => 'يرجى اختيار تاريخ الإصدار';

  @override
  String createInvoiceItemNameRequired(Object number) {
    return 'البند $number: الاسم مطلوب';
  }

  @override
  String createInvoiceItemQuantityRequired(Object number) {
    return 'البند $number: يجب أن تكون الكمية أكبر من 0';
  }

  @override
  String createInvoiceItemUnitPriceRequired(Object number) {
    return 'البند $number: يجب أن يكون سعر الوحدة أكبر من 0';
  }

  @override
  String get createInvoiceSomethingWentWrong => 'حدث خطأ ما!';

  @override
  String get comment_create_invoice_screen => '==== Create Invoice Screen ====';

  @override
  String get createInvoiceScreenTitle => 'إنشاء فاتورة';

  @override
  String get createInvoiceScreenInvoiceItems => 'بنود الفاتورة';

  @override
  String get createInvoiceScreenAddItem => 'إضافة بند';

  @override
  String get createInvoiceScreenCreateInvoiceButton => 'إنشاء فاتورة';

  @override
  String get comment_create_invoice_add_item_section =>
      '==== Create Invoice Add Item Section ====';

  @override
  String get createInvoiceAddItemItemName => 'اسم البند';

  @override
  String get createInvoiceAddItemQuantity => 'الكمية';

  @override
  String get createInvoiceAddItemUnitPrice => 'سعر الوحدة';

  @override
  String get createInvoiceAddItemSubTotal => 'المجموع الفرعي';

  @override
  String get comment_create_invoice_information_section =>
      '==== Create Invoice Information Section ====';

  @override
  String get createInvoiceInformationTitle => 'معلومات الفاتورة';

  @override
  String get createInvoiceInformationInvoiceTo => 'إلى';

  @override
  String get createInvoiceInformationEmailAddress => 'البريد الإلكتروني';

  @override
  String get createInvoiceInformationAddress => 'العنوان';

  @override
  String get createInvoiceInformationSelectWallet => 'اختر المحفظة';

  @override
  String get createInvoiceInformationStatus => 'الحالة';

  @override
  String get createInvoiceInformationIssueDate => 'تاريخ الإصدار';

  @override
  String get createInvoiceInformationSelectWalletTitle => 'اختر المحفظة';

  @override
  String get createInvoiceInformationWalletsNotFound => 'المحافظ غير موجودة';

  @override
  String get createInvoiceInformationSelectStatusTitle => 'اختر الحالة';

  @override
  String get createInvoiceInformationStatusNotFound => 'الحالة غير موجودة';

  @override
  String get comment_invoice_details_screen =>
      '==== Invoice Details Screen ====';

  @override
  String get invoiceDetailsTitle => 'فاتورة';

  @override
  String invoiceDetailsRefNumber(Object number) {
    return 'المرجع: #$number';
  }

  @override
  String invoiceDetailsIssuedDate(Object date) {
    return 'تاريخ الإصدار: $date';
  }

  @override
  String get invoiceDetailsName => 'الاسم';

  @override
  String get invoiceDetailsEmail => 'البريد الإلكتروني';

  @override
  String get invoiceDetailsCharge => 'الرسوم';

  @override
  String get invoiceDetailsAddress => 'العنوان';

  @override
  String get invoiceDetailsTotalAmount => 'المبلغ الإجمالي';

  @override
  String get invoiceDetailsStatus => 'الحالة';

  @override
  String get invoiceDetailsItemName => 'اسم البند';

  @override
  String get invoiceDetailsQuantity => 'الكمية';

  @override
  String get invoiceDetailsUnitPrice => 'سعر الوحدة';

  @override
  String get invoiceDetailsSubTotal => 'المجموع الفرعي';

  @override
  String get invoiceDetailsPayNowButton => 'ادفع الآن';

  @override
  String get invoiceDetailsPrintInvoiceButton => 'طباعة الفاتورة';

  @override
  String get comment_invoice_pdf => '==== Invoice PDF Generator ====';

  @override
  String invoicePdfRefNumber(Object number) {
    return 'المرجع: #$number';
  }

  @override
  String invoicePdfIssuedDate(Object date) {
    return 'تاريخ الإصدار: $date';
  }

  @override
  String get invoicePdfTotalAmount => 'المبلغ الإجمالي:';

  @override
  String get invoicePdfAmount => 'المبلغ:';

  @override
  String get invoicePdfCharge => 'الرسوم:';

  @override
  String get invoicePdfItemName => 'اسم البند';

  @override
  String get invoicePdfQuantity => 'الكمية';

  @override
  String get invoicePdfUnitPrice => 'سعر الوحدة';

  @override
  String get invoicePdfSubtotal => 'المجموع الفرعي';

  @override
  String get invoicePdfSubtotalLabel => 'المجموع الفرعي: ';

  @override
  String get invoicePdfChargeLabel => 'الرسوم: ';

  @override
  String get invoicePdfTotalAmountLabel => 'المبلغ الإجمالي: ';

  @override
  String get invoicePdfThanksMessage => 'شكراً لك على الشراء.';

  @override
  String get comment_update_invoice_screen => '==== Update Invoice Screen ====';

  @override
  String get updateInvoiceTitle => 'تحديث الفاتورة';

  @override
  String get updateInvoiceInvoiceItems => 'بنود الفاتورة';

  @override
  String get updateInvoiceAddItem => 'إضافة بند';

  @override
  String get updateInvoiceUpdateInvoiceButton => 'تحديث الفاتورة';

  @override
  String get comment_update_invoice_add_item_section =>
      '==== Update Invoice Add Item Section ====';

  @override
  String get updateInvoiceAddItemItemName => 'اسم البند';

  @override
  String get updateInvoiceAddItemQuantity => 'الكمية';

  @override
  String get updateInvoiceAddItemUnitPrice => 'سعر الوحدة';

  @override
  String get updateInvoiceAddItemSubTotal => 'المجموع الفرعي';

  @override
  String get comment_update_invoice_information_section =>
      '==== Update Invoice Information Section ====';

  @override
  String get updateInvoiceInformationTitle => 'معلومات الفاتورة';

  @override
  String get updateInvoiceInformationInvoiceTo => 'إلى';

  @override
  String get updateInvoiceInformationEmailAddress => 'البريد الإلكتروني';

  @override
  String get updateInvoiceInformationAddress => 'العنوان';

  @override
  String get updateInvoiceInformationSelectWallet => 'اختر المحفظة';

  @override
  String get updateInvoiceInformationStatus => 'الحالة';

  @override
  String get updateInvoiceInformationIssueDate => 'تاريخ الإصدار';

  @override
  String get updateInvoiceInformationPaymentStatus => 'حالة الدفع';

  @override
  String get updateInvoiceInformationSelectWalletTitle => 'اختر المحفظة';

  @override
  String get updateInvoiceInformationWalletsNotFound => 'المحافظ غير موجودة';

  @override
  String get updateInvoiceInformationSelectStatusTitle => 'اختر الحالة';

  @override
  String get updateInvoiceInformationStatusNotFound => 'الحالة غير موجودة';

  @override
  String get updateInvoiceInformationSelectPaymentStatusTitle =>
      'اختر حالة الدفع';

  @override
  String get updateInvoiceInformationPaymentStatusNotFound =>
      'حالة الدفع غير موجودة';

  @override
  String get comment_invoice_screen => '==== Invoice Screen ====';

  @override
  String get invoiceScreenTitle => 'فاتورة';

  @override
  String get invoiceScreenCreateInvoice => 'إنشاء فاتورة';

  @override
  String get invoiceScreenAmountLabel => 'المبلغ:';

  @override
  String get invoiceScreenChargeLabel => 'الرسوم:';

  @override
  String get invoiceScreenStatusLabel => 'الحالة: ';

  @override
  String get invoiceScreenViewButton => 'عرض';

  @override
  String get comment_notification_screen => '==== Notification Screen ====';

  @override
  String get notificationScreenTitle => 'الإشعارات';

  @override
  String get notificationScreenMarkAll => 'تحديد الكل كمقروء';

  @override
  String get comment_profile_screen => '==== Profile Screen ====';

  @override
  String get profileScreenTitle => 'الملف الشخصي';

  @override
  String get profileScreenProfileSettings => 'إعدادات الملف الشخصي';

  @override
  String get profileScreenChangePassword => 'تغيير كلمة المرور';

  @override
  String get profileScreenLanguage => 'اللغة';

  @override
  String get profileScreenBiometric => 'التحقق البيومتري';

  @override
  String get profileScreenLogout => 'تسجيل الخروج';

  @override
  String get profileScreenBackButton => 'رجوع';

  @override
  String get profileScreenSelectLanguageTitle => 'اختر اللغة';

  @override
  String get comment_profile_settings_screen =>
      '==== Profile Settings Screen ====';

  @override
  String get profileSettingsTitle => 'إعدادات الملف الشخصي';

  @override
  String get profileSettingsFirstName => 'الاسم الأول';

  @override
  String get profileSettingsLastName => 'الاسم الأخير';

  @override
  String get profileSettingsUserName => 'اسم المستخدم';

  @override
  String get profileSettingsGender => 'الجنس';

  @override
  String get profileSettingsDateOfBirth => 'تاريخ الميلاد';

  @override
  String get profileSettingsEmailAddress => 'البريد الإلكتروني';

  @override
  String get profileSettingsPhone => 'الهاتف';

  @override
  String get profileSettingsCountry => 'البلد';

  @override
  String get profileSettingsCity => 'المدينة';

  @override
  String get profileSettingsZipCode => 'الرمز البريدي';

  @override
  String get profileSettingsJoiningDate => 'تاريخ الانضمام';

  @override
  String get profileSettingsAddress => 'العنوان';

  @override
  String get profileSettingsSaveChanges => 'حفظ التغييرات';

  @override
  String get profileSettingsSelectGenderTitle => 'اختر الجنس';

  @override
  String get profileSettingsNoGenderFound => 'لا يوجد جنس';

  @override
  String get profileSettingsSelectCountryTitle => 'اختر البلد';

  @override
  String get profileSettingsNoCountryFound => 'لا توجد بلد';

  @override
  String get comment_qr_code_screen => '==== QR Code Screen ====';

  @override
  String get qrCodeTitle => 'رمز QR الخاص بي';

  @override
  String qrCodeMerchantId(Object accountNumber) {
    return 'معرف التاجر: $accountNumber';
  }

  @override
  String get qrCodeDownloadButton => 'تحميل';

  @override
  String get qrCodeDownloadSuccess => 'تم التحميل بنجاح!';

  @override
  String get qrCodePermissionRequired =>
      'الإذن مطلوب. يرجى السماح به في الإعدادات.';

  @override
  String get comment_add_new_ticket_controller =>
      '==== Add New Ticket Controller Messages ====';

  @override
  String get addNewTicketTitleRequired => 'يرجى إدخال العنوان';

  @override
  String get addNewTicketDescriptionRequired => 'يرجى إدخال الوصف';

  @override
  String get addNewTicketSuccessMessage => 'تم إنشاء التذكرة بنجاح';

  @override
  String get comment_add_new_ticket_screen => '==== Add New Ticket Screen ====';

  @override
  String get addNewTicketTitle => 'إنشاء تذكرة';

  @override
  String get addNewTicketTitleLabel => 'العنوان';

  @override
  String get addNewTicketDescriptionLabel => 'الوصف';

  @override
  String get addNewTicketAddAttach => 'إضافة مرفق';

  @override
  String get addNewTicketAttachFile => 'إرفاق ملف';

  @override
  String get addNewTicketAddTicketButton => 'إضافة تذكرة';

  @override
  String get comment_replay_ticket_screen => '==== Replay Ticket Screen ====';

  @override
  String get replayTicketCloseButton => 'إغلاق';

  @override
  String get replayTicketMessageRequired => 'يرجى إدخال رسالة';

  @override
  String get replayTicketAttachmentsLabel => 'المرفقات:';

  @override
  String get replayTicketUnknownFile => 'ملف غير معروف';

  @override
  String get replayTicketTypeMessageHint => 'اكتب رسالتك';

  @override
  String get replayTicketAttachmentPreviewTitle => 'معاينة المرفق';

  @override
  String get comment_support_ticket_screen => '==== Support Ticket Screen ====';

  @override
  String get supportTicketTitle => 'تذكرة الدعم';

  @override
  String get supportTicketStatusOpen => 'مفتوحة';

  @override
  String get supportTicketStatusClosed => 'مغلقة';

  @override
  String get supportTicketViewButton => 'عرض';

  @override
  String get comment_transaction_filter_bottom_sheet =>
      '==== Transaction Filter Bottom Sheet ====';

  @override
  String get transactionFilterTransactionId => 'رقم المعاملة';

  @override
  String get transactionFilterStatus => 'الحالة';

  @override
  String get transactionFilterApplyButton => 'تطبيق';

  @override
  String get comment_transactions_screen => '==== Transactions Screen ====';

  @override
  String get transactionsScreenTitle => 'المعاملات';

  @override
  String get comment_two_fa_authentication_screen =>
      '==== 2FA Authentication Screen ====';

  @override
  String get twoFaAuthenticationTitle => 'التحقق بخطوتين';

  @override
  String get comment_disable_two_fa_section => '==== Disable 2FA Section ====';

  @override
  String get disableTwoFaTitle => 'التحقق بخطوتين';

  @override
  String get disableTwoFaInstruction =>
      'أدخل كلمة المرور لتعطيل التحقق بخطوتين';

  @override
  String get disableTwoFaPasswordRequired => 'يرجى إدخال كلمة المرور';

  @override
  String get disableTwoFaButton => 'تعطيل التحقق بخطوتين';

  @override
  String get comment_enable_two_fa_section => '==== Enable 2FA Section ====';

  @override
  String get enableTwoFaTitle => 'التحقق بخطوتين';

  @override
  String get enableTwoFaInstruction =>
      'امسح رمز QR بتطبيق Google Authenticator\nلتفعيل التحقق بخطوتين';

  @override
  String get enableTwoFaPinLabel => 'رمز PIN من تطبيق Google Authenticator';

  @override
  String get enableTwoFaPinRequired => 'يرجى إدخال رمز التحقق من Google';

  @override
  String get enableTwoFaButton => 'تفعيل التحقق بخطوتين';

  @override
  String get comment_generate_qr_code_section =>
      '==== Generate QR Code Section ====';

  @override
  String get generateQrCodeTitle => 'التحقق بخطوتين';

  @override
  String get generateQrCodeDescription =>
      'عزز أمان حسابك باستخدام التحقق بخطوتين';

  @override
  String get generateQrCodeButton => 'إنشاء رمز التحقق';

  @override
  String get comment_create_new_wallet_screen =>
      '==== Create New Wallet Screen ====';

  @override
  String get createNewWalletTitle => 'إنشاء محفظة جديدة';

  @override
  String get createNewWalletSelectCurrency => 'اختر العملة';

  @override
  String get createNewWalletCurrencyLabel => 'العملة';

  @override
  String get createNewWalletCreateButton => 'إنشاء';

  @override
  String get createNewWalletSelectCurrencyTitle => 'اختر العملة';

  @override
  String get createNewWalletNoCurrencyFound => 'لا توجد عملة';

  @override
  String get comment_delete_wallet_bottom_sheet =>
      '==== Delete Wallet Bottom Sheet ====';

  @override
  String get deleteWalletTitle => 'هل أنت متأكد؟';

  @override
  String get deleteWalletMessage => 'بمجرد حذف بياناتك، لن تتمكن من استرجاعها!';

  @override
  String get deleteWalletConfirmButton => 'تأكيد';

  @override
  String get comment_wallet_details_screen => '==== Wallet Details Screen ====';

  @override
  String get walletDetailsTitle => 'تفاصيل المحفظة';

  @override
  String get walletDetailsTotalBalance => 'إجمالي الرصيد';

  @override
  String get walletDetailsWithdrawButton => 'سحب';

  @override
  String get walletDetailsHistory => 'السجل';

  @override
  String get walletDetailsSelectWalletTitle => 'اختر المحفظة';

  @override
  String get walletDetailsWalletNotFound => 'المحفظة غير موجودة';

  @override
  String get comment_wallets_screen => '==== Wallets Screen ====';

  @override
  String get walletsScreenTitle => 'محافظي';

  @override
  String get walletsScreenWithdrawButton => 'سحب';

  @override
  String get walletsScreenDeleteButton => 'حذف';

  @override
  String get comment_create_withdraw_account_controller =>
      '==== Create Withdraw Account Controller Messages ====';

  @override
  String get createWithdrawAccountWalletRequired => 'يرجى اختيار محفظة';

  @override
  String get createWithdrawAccountWithdrawMethodRequired =>
      'يرجى اختيار طريقة سحب';

  @override
  String get createWithdrawAccountMethodNameRequired =>
      'يرجى إدخال اسم الطريقة';

  @override
  String createWithdrawAccountFileRequired(Object fieldName) {
    return 'يرجى رفع ملف لـ $fieldName';
  }

  @override
  String createWithdrawAccountFieldRequired(Object fieldName) {
    return 'يرجى ملء حقل $fieldName';
  }

  @override
  String get comment_withdraw_controller =>
      '==== Withdraw Controller Messages ====';

  @override
  String get withdrawWithdrawAccountRequired => 'يرجى اختيار حساب سحب';

  @override
  String get withdrawAmountRequired => 'يرجى إدخال المبلغ';

  @override
  String withdrawMinAmountError(Object currency, Object min) {
    return 'الحد الأدنى للمبلغ هو $min $currency';
  }

  @override
  String withdrawMaxAmountError(Object currency, Object max) {
    return 'الحد الأقصى للمبلغ هو $max $currency';
  }

  @override
  String get comment_create_withdraw_account_screen =>
      '==== Create Withdraw Account Screen ====';

  @override
  String get createWithdrawAccountScreenTitle => 'إنشاء حساب سحب';

  @override
  String get createWithdrawAccountScreenHeader => 'إنشاء حساب سحب';

  @override
  String get createWithdrawAccountScreenWalletLabel => 'المحفظة';

  @override
  String get createWithdrawAccountScreenWithdrawMethodLabel => 'طريقة السحب';

  @override
  String get createWithdrawAccountScreenMethodNameLabel => 'اسم الطريقة';

  @override
  String get createWithdrawAccountScreenCreateButton => 'إنشاء';

  @override
  String get createWithdrawAccountScreenSelectWalletTitle => 'اختر المحفظة';

  @override
  String get createWithdrawAccountScreenWalletNotFound => 'المحفظة غير موجودة';

  @override
  String get createWithdrawAccountScreenSelectMethodTitle => 'اختر الطريقة';

  @override
  String get createWithdrawAccountScreenWithdrawMethodNotFound =>
      'طريقة السحب غير موجودة';

  @override
  String get comment_edit_withdraw_account_screen =>
      '==== Edit Withdraw Account Screen ====';

  @override
  String get editWithdrawAccountScreenTitle => 'تعديل حساب السحب';

  @override
  String get editWithdrawAccountScreenHeader => 'تعديل حساب السحب';

  @override
  String get editWithdrawAccountScreenMethodNameLabel => 'اسم الطريقة';

  @override
  String get editWithdrawAccountScreenUpdateButton => 'تحديث';

  @override
  String get comment_withdraw_screen => '==== Withdraw Screen ====';

  @override
  String get withdrawScreenTitle => 'سحب أموال';

  @override
  String get comment_delete_account_dropdown_section =>
      '==== Delete Account Dropdown Section ====';

  @override
  String get deleteAccountTitle => 'حذف حساب السحب؟';

  @override
  String get deleteAccountWarningPart1 =>
      'لا يمكن التراجع عن هذا. جميع البيانات سيتم';

  @override
  String get deleteAccountWarningPart2 => ' حذفها.';

  @override
  String get deleteAccountDeleteButton => 'حذف';

  @override
  String get deleteAccountCancelButton => 'إلغاء';

  @override
  String get comment_withdraw_account_filter_bottom_sheet =>
      '==== Withdraw Account Filter Bottom Sheet ====';

  @override
  String get withdrawAccountFilterAccountName => 'اسم الحساب';

  @override
  String get withdrawAccountFilterSearchButton => 'بحث';

  @override
  String get comment_withdraw_account_section =>
      '==== Withdraw Account Section ====';

  @override
  String get withdrawAccountSectionAllAccount => 'جميع الحسابات';

  @override
  String get withdrawAccountSectionAddAccount => 'إضافة حساب';

  @override
  String get comment_withdraw_amount_step_section =>
      '==== Withdraw Amount Step Section ====';

  @override
  String get withdrawAmountStepAccount => 'الحساب';

  @override
  String get withdrawAmountStepAmount => 'المبلغ';

  @override
  String get withdrawAmountStepContinueButton => 'متابعة';

  @override
  String withdrawAmountStepMinMaxAmount(
    Object currency,
    Object max,
    Object min,
  ) {
    return 'الحد الأدنى $min $currency والحد الأقصى $max $currency';
  }

  @override
  String get withdrawAmountStepSelectWithdrawAccountTitle => 'اختر حساب السحب';

  @override
  String get withdrawAmountStepWithdrawAccountNotFound =>
      'حساب السحب غير موجود';

  @override
  String get withdrawAmountStepSelectWalletTitle => 'اختر المحفظة';

  @override
  String get withdrawAmountStepWalletsNotFound => 'المحافظ غير موجودة';

  @override
  String get comment_withdraw_review_step_section =>
      '==== Withdraw Review Step Section ====';

  @override
  String get withdrawReviewStepTitle => 'مراجعة التفاصيل';

  @override
  String get withdrawReviewStepAmount => 'المبلغ';

  @override
  String get withdrawReviewStepCharge => 'الرسوم';

  @override
  String get withdrawReviewStepTotal => 'الإجمالي';

  @override
  String get withdrawReviewStepWithdrawNowButton => 'سحب الآن';

  @override
  String get comment_withdraw_success_step_section =>
      '==== Withdraw Success Step Section ====';

  @override
  String get withdrawSuccessStepTitle => 'السحب قيد الانتظار';

  @override
  String get withdrawSuccessStepSubtitle => 'أموالك قيد انتظار\nالسحب.';

  @override
  String get withdrawSuccessStepAmount => 'المبلغ';

  @override
  String get withdrawSuccessStepTransactionId => 'رقم المعاملة';

  @override
  String get withdrawSuccessStepCharge => 'الرسوم';

  @override
  String get withdrawSuccessStepTransactionType => 'نوع المعاملة';

  @override
  String get withdrawSuccessStepFinalAmount => 'المبلغ النهائي';

  @override
  String get withdrawSuccessStepDateTime => 'التاريخ والوقت';

  @override
  String get withdrawSuccessStepBackHomeButton => 'العودة للرئيسية';

  @override
  String get withdrawSuccessStepWithdrawAgainButton => 'سحب مرة أخرى';

  @override
  String get comment_withdraw_toggle_section =>
      '==== Withdraw Toggle Section ====';

  @override
  String get withdrawToggleWithdraw => 'سحب';

  @override
  String get withdrawToggleWithdrawAccount => 'حساب السحب';

  @override
  String get comment_dynamic_attachment_preview =>
      '==== Dynamic Attachment Preview ====';

  @override
  String get dynamicAttachmentPreviewTitle => 'معاينة المرفق';

  @override
  String get comment_no_internet_connection_screen =>
      '==== No Internet Connection Screen ====';

  @override
  String get noInternetConnectionTitle => 'لا يوجد اتصال بالإنترنت';

  @override
  String get noInternetConnectionMessage => 'يرجى التحقق من إعدادات الشبكة';

  @override
  String get noInternetConnectionRetryButton => 'إعادة المحاولة';

  @override
  String get comment_web_view_screen => '==== Web View Screen ====';

  @override
  String get webViewPaymentSuccess => 'تمت الدفعة بنجاح!';

  @override
  String get webViewPaymentFailed => 'فشلت الدفعة!';

  @override
  String get webViewPaymentCancelled => 'تم إلغاء الدفعة!';
}
