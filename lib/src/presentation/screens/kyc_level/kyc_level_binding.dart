import 'package:get/get.dart';
import 'package:qunzo_merchant/src/presentation/screens/kyc_level/controller/kyc_level_controller.dart';

/// KycLevelBinding — ثبت KycLevelController برای صفحات navigation
///
/// v1.0.3: از Get.put استفاده می‌کنیم (نه lazyPut) تا controller
/// فورا ساخته شود و drawer بتواند به آن دسترسی داشته باشد.
/// `permanent: true` عمدا استفاده نشده — کنترلر باید با logout آزاد شود؛
/// permanent باعث می‌شد وضعیت KYC کاربر قبلی پس از خروج
/// هم در حافظه بماند و به کاربر بعدی نشت کند.
class KycLevelBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<KycLevelController>(KycLevelController());
  }
}
