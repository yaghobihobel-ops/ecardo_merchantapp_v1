import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qunzo_merchant/l10n/app_localizations.dart';
import 'package:qunzo_merchant/src/app/constants/app_colors.dart';
import 'package:qunzo_merchant/src/app/routes/routes.dart';
import 'package:qunzo_merchant/src/common/widgets/app_bar/common_app_bar.dart';
import 'package:qunzo_merchant/src/common/widgets/app_bar/common_default_app_bar.dart';
import 'package:qunzo_merchant/src/common/widgets/common_loading.dart';
import 'package:qunzo_merchant/src/presentation/screens/id_verification/controller/id_verification_controller.dart';
import 'package:qunzo_merchant/src/presentation/screens/kyc_level/controller/kyc_level_controller.dart';
import 'package:qunzo_merchant/src/presentation/screens/kyc_level/view/kyc_level_badge.dart';
import 'package:qunzo_merchant/src/presentation/screens/kyc_level/view/kyc_level_roadmap.dart';

class IdVerificationScreen extends StatefulWidget {
  const IdVerificationScreen({super.key});

  @override
  State<IdVerificationScreen> createState() => _IdVerificationScreenState();
}

class _IdVerificationScreenState extends State<IdVerificationScreen> {
  final IdVerificationController controller = Get.find();

  Future<void> refreshData() async {
    await controller.fetchUser();
    // v1.0.3 (KYC): pull-to-refresh also re-pulls the level roadmap state.
    if (Get.isRegistered<KycLevelController>()) {
      await Get.find<KycLevelController>().fetchStatus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: CommonDefaultAppBar(),
      body: Column(
        children: [
          CommonAppBar(
            title: localization.idVerificationTitle,
            showRightSideWidget: true,
            rightSideWidget: GestureDetector(
              onTap: () => Get.toNamed(BaseRoute.kycHistory),
              child: Text(
                localization.idVerificationHistory,
                style: TextStyle(
                  letterSpacing: 0,
                  fontWeight: FontWeight.w900,
                  fontSize: 14,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.white,
                  decorationThickness: 2,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const CommonLoading();
              }

              return RefreshIndicator(
                color: AppColors.lightPrimary,
                onRefresh: () => refreshData(),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            // v57: KYC Level Badge
                            const KycLevelBadge(),
                            const SizedBox(height: 20),
                            _buildVerificationSection(),
                            // v1.0.3 (KYC): the visual level roadmap —
                            // replaces the old "nothing to submit" stub.
                            const SizedBox(height: 20),
                            KycLevelRoadmap(
                              onLevelTap: () {
                                final kycController =
                                    Get.find<KycLevelController>();
                                final nextLevel =
                                    kycController.nextLevel?.level ?? 2;
                                Get.toNamed(
                                  BaseRoute.kycSubmitWizard,
                                  arguments: {'target_level': nextLevel},
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildVerificationSection() {
    final kyc = controller.userModel.value.data?.user?.kyc;
    final kycInfo = getKycStatusInfo(kyc: kyc, context: context);
    final localization = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: kycInfo.color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(13),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: kycInfo.color,
            ),
            child: Icon(kycInfo.icon, color: AppColors.white),
          ),
          const SizedBox(height: 7),
          Text(
            localization.idVerificationVerificationCenter,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20,
              color: AppColors.lightTextPrimary,
              letterSpacing: 0,
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Text(
              kycInfo.message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: AppColors.lightTextTertiary,
                letterSpacing: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class KycStatusInfo {
  final Color color;
  final IconData icon;
  final String message;

  KycStatusInfo({
    required this.color,
    required this.icon,
    required this.message,
  });
}

KycStatusInfo getKycStatusInfo({
  required int? kyc,
  required BuildContext context,
}) {
  final localization = AppLocalizations.of(context)!;
  switch (kyc) {
    case 1:
      return KycStatusInfo(
        color: AppColors.success,
        icon: Icons.check_circle_outline_outlined,
        message: localization.idVerificationStatus1Message,
      );
    case 2:
      return KycStatusInfo(
        color: AppColors.warning,
        icon: Icons.warning_amber_outlined,
        message: localization.idVerificationStatus2Message,
      );
    case 3:
      return KycStatusInfo(
        color: AppColors.error,
        icon: Icons.error_outline_outlined,
        message: localization.idVerificationStatus3Message,
      );
    case 4:
    default:
      return KycStatusInfo(
        color: AppColors.warning,
        icon: Icons.error_outline_outlined,
        message: localization.idVerificationStatus4Message,
      );
  }
}
