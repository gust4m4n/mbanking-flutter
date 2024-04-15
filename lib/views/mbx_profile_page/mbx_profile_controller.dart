import 'package:mbankingflutter/viewmodels/mbx_preferences_vm+users.dart';
import 'package:mbankingflutter/views/mbx_tnc_screen/mbx_tnc_screen.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../viewmodels/mbx_logout_vm.dart';
import '../../viewmodels/mbx_profile_vm.dart';
import '../../widgets/all_widgets.dart';
import '../mbx_pin_sheet/mbx_pin_sheet.dart';
import '../mbx_privacy_policy_screen/mbx_privacy_policy_screen.dart';

class MbxProfileController extends GetxController {
  var biometricEnabled = false;
  var version = '';

  @override
  Future<void> onReady() async {
    super.onReady();
    final info = await PackageInfo.fromPlatform();
    version = 'Version ${info.version}.${info.buildNumber}';
    await MbxProfileVM.request();
    biometricEnabled = await MbxUserPreferencesVM.getBiometricEnabled();
    update();
  }

  toggleBiometric(bool value) async {
    update();
    MbxPinSheet.show(
        title: 'PIN',
        description: 'Masukkan nomor pin m-banking atau ATM anda.',
        onSubmit: (code, biometricAuthenticated) async {
          await MbxUserPreferencesVM.setBiometricEnabled(value);
          MbxProfileVM.profile.biometric = value;
          update();
          Get.back();
        }).then((value) async {
      biometricEnabled = await MbxUserPreferencesVM.getBiometricEnabled();
      update();
    });
  }

  btnTncClicked() {
    Get.to(MbxTncScreen());
  }

  btnPrivacyPolicyClicked() {
    Get.to(MbxPrivacyPolicyScreen());
  }

  btnLogoutClicked() {
    SheetX.showMessage(
        title: 'Keluar',
        message: 'Apakah anda yakin ?',
        leftBtnTitle: 'Ya',
        onLeftBtnClicked: () {
          Get.loading();
          MbxLogoutVM.request().then((resp) {
            Get.back();
            MbxProfileVM.logout();
          });
        },
        rightBtnTitle: 'Tidak',
        onRightBtnClicked: () {
          Get.back();
        });
  }
}
