import 'package:get/get.dart';
import 'package:qunzo_merchant/src/app/bindings/app_bindings.dart';
import 'package:qunzo_merchant/src/app/routes/routes.dart';
import 'package:qunzo_merchant/src/app/routes/routes_config.dart';
import 'package:qunzo_merchant/src/presentation/screens/kyc_level/kyc_level_binding.dart';
import 'package:qunzo_merchant/src/presentation/screens/kyc_level/view/kyc_submit_wizard.dart';

List<GetPage> routesHandler = [
  GetPage(
    name: BaseRoute.splash,
    page: () => RoutesConfig.splash,
    binding: SplashBinding(),
  ),

  GetPage(name: BaseRoute.welcome, page: () => RoutesConfig.welcome),

  GetPage(
    name: BaseRoute.login,
    page: () => RoutesConfig.login,
    binding: LoginBinding(),
  ),

  GetPage(
    name: BaseRoute.forgotPassword,
    page: () => RoutesConfig.forgotPassword,
    binding: ForgotPasswordBinding(),
  ),

  GetPage(
    name: BaseRoute.navigation,
    page: () => RoutesConfig.navigation,
    bindings: [
      HomeBinding(),
      UserProfileBinding(),
      WalletsBinding(),
      // v1.0.3 (KYC): roadmap/badge/widget tree need the controller alive
      // for the whole logged-in session (freed on logout — see binding).
      KycLevelBinding(),
    ],
  ),

  GetPage(
    name: BaseRoute.wallets,
    page: () => RoutesConfig.wallets,
    binding: WalletsBinding(),
  ),

  GetPage(
    name: BaseRoute.qrCode,
    page: () => RoutesConfig.qrCode,
    binding: QrCodeBinding(),
  ),

  GetPage(
    name: BaseRoute.apiAccessKey,
    page: () => RoutesConfig.apiAccessKey,
    binding: ApiAccessKeyBinding(),
  ),

  GetPage(
    name: BaseRoute.transactions,
    page: () => RoutesConfig.transactions,
    binding: TransactionsBinding(),
  ),

  GetPage(
    name: BaseRoute.resetPassword,
    page: () => RoutesConfig.resetPassword,
    binding: ResetPasswordBinding(),
  ),

  GetPage(
    name: BaseRoute.forgotPasswordPinVerification,
    page: () => RoutesConfig.forgotPasswordPinVerification,
    binding: ForgotPasswordPinVerificationBinding(),
  ),

  GetPage(
    name: BaseRoute.twoFactorAuth,
    page: () => RoutesConfig.twoFactorAuth,
    binding: TwoFactorAuthBinding(),
  ),

  GetPage(
    name: BaseRoute.notification,
    page: () => RoutesConfig.notification,
    binding: NotificationBinding(),
  ),

  GetPage(name: BaseRoute.profile, page: () => RoutesConfig.profile),

  GetPage(
    name: BaseRoute.createNewWallet,
    page: () => RoutesConfig.createNewWallet,
    binding: CreateNewWalletBinding(),
  ),

  GetPage(
    name: BaseRoute.profileSettings,
    page: () => RoutesConfig.profileSettings,
    binding: ProfileSettingsBinding(),
  ),

  GetPage(
    name: BaseRoute.changePassword,
    page: () => RoutesConfig.changePassword,
    binding: ChangePasswordBinding(),
  ),

  GetPage(
    name: BaseRoute.supportTicket,
    page: () => RoutesConfig.supportTicket,
    binding: SupportTicketBinding(),
  ),

  GetPage(
    name: BaseRoute.addNewTicket,
    page: () => RoutesConfig.addNewTicket,
    binding: AddNewTicketBinding(),
  ),

  GetPage(
    name: BaseRoute.withdraw,
    page: () => RoutesConfig.withdraw,
    bindings: [WithdrawBinding(), WithdrawAccountBinding()],
  ),

  GetPage(
    name: BaseRoute.createWithdrawAccount,
    page: () => RoutesConfig.createWithdrawAccount,
    binding: CreateWithdrawAccountBinding(),
  ),

  GetPage(
    name: BaseRoute.walletsDetails,
    page: () => RoutesConfig.walletsDetails,
    binding: WalletDetailsBinding(),
  ),

  GetPage(
    name: BaseRoute.email,
    page: () => RoutesConfig.email,
    binding: EmailBinding(),
  ),

  GetPage(
    name: BaseRoute.verifyEmail,
    page: () => RoutesConfig.verifyEmail,
    binding: VerifyEmailBinding(),
  ),

  GetPage(
    name: BaseRoute.signUpStatus,
    page: () => RoutesConfig.signUpStatus,
    binding: SignUpStatusBinding(),
  ),

  GetPage(
    name: BaseRoute.setUpPassword,
    page: () => RoutesConfig.setUpPassword,
    binding: SetUpPasswordBinding(),
  ),

  GetPage(
    name: BaseRoute.personalInfo,
    page: () => RoutesConfig.personalInfo,
    bindings: [
      PersonalInfoBinding(),
      RegisterFieldsBinding(),
      CountryBinding(),
    ],
  ),

  GetPage(
    name: BaseRoute.authIdVerification,
    page: () => RoutesConfig.authIdVerification,
    binding: AuthIdVerificationBinding(),
  ),

  // v1.0.3: this GetPage used to be registered twice (here and at the top
  // of the list) — the second registration silently overrode the first.
  // Deduplicated; the single registration below stays.
  GetPage(
    name: BaseRoute.idVerification,
    page: () => RoutesConfig.idVerification,
    binding: IdVerificationBinding(),
  ),

  GetPage(
    name: BaseRoute.kycHistory,
    page: () => RoutesConfig.kycHistory,
    binding: KycHistoryBinding(),
  ),

  GetPage(
    name: BaseRoute.twoFaAuthentication,
    page: () => RoutesConfig.twoFaAuthentication,
    bindings: [TwoFaAuthenticationBinding(), UserProfileBinding()],
  ),

  GetPage(
    name: BaseRoute.noInternetConnection,
    page: () => RoutesConfig.noInternetConnection,
  ),

  GetPage(
    name: BaseRoute.exchange,
    page: () => RoutesConfig.exchange,
    binding: ExchangeBinding(),
  ),

  GetPage(
    name: BaseRoute.invoice,
    page: () => RoutesConfig.invoice,
    binding: InvoiceBinding(),
  ),

  GetPage(
    name: BaseRoute.createInvoice,
    page: () => RoutesConfig.createInvoice,
    binding: CreateInvoiceBinding(),
  ),

  GetPage(
    name: BaseRoute.updateInvoice,
    page: () => RoutesConfig.updateInvoice,
    binding: UpdateInvoiceBinding(),
  ),

  GetPage(
    name: BaseRoute.invoiceDetails,
    page: () => RoutesConfig.invoiceDetails,
    binding: InvoiceDetailsBinding(),
  ),

  GetPage(
    name: BaseRoute.maintenanceMode,
    page: () => RoutesConfig.maintenanceMode,
  ),

  // App self-update (in-app updater)
  GetPage(
    name: BaseRoute.appUpdate,
    page: () => RoutesConfig.appUpdate,
  ),

  // KYC Level Routes (v1.0.3)
  GetPage(
    name: BaseRoute.kycSubmitWizard,
    // Read target_level from route arguments — the wizard must show the
    // target level's documents, never hardcoded level 2.
    page: () {
      final args = Get.arguments;
      final parsed = args is Map
          ? int.tryParse('${args['target_level'] ?? ''}')
          : null;
      return KycSubmitWizard(targetLevel: parsed ?? 2);
    },
  ),
  GetPage(
    name: BaseRoute.upgradeRequired,
    page: () => RoutesConfig.upgradeRequired,
  ),
];
