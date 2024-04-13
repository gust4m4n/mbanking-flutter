import 'package:package_info_plus/package_info_plus.dart';

import '../../utils/all_utils.dart';
import '../../viewmodels/mbx_login_pin_vm.dart';
import '../../viewmodels/mbx_logout_vm.dart';
import '../../viewmodels/mbx_profile_vm.dart';
import '../../viewmodels/mbx_theme_vm.dart';
import '../../widgets/all_widgets.dart';
import '../mbx_bottom_navbar_screen/mbx_bottom_navbar_screen.dart';
import '../mbx_pin_sheet/mbx_pin_sheet.dart';

class MbxReloginController extends GetxController {
  var version = '';

  @override
  void onReady() {
    super.onReady();
    PackageInfo.fromPlatform().then((info) {
      version = 'Version ${info.version}.${info.buildNumber}';
      update();
    });
    MbxProfileVM.request().then((resp) {
      update();
    });
    btnLoginClicked();
  }

  btnThemeClicked() {
    MbxThemeVM.change().then((value) {
      update();
    });
  }

  btnLoginClicked() {
    MbxPinSheet.show(
        title: 'PIN',
        description: 'Masukkan nomor pin m-banking atau ATM anda.',
        onSubmit: (code, biometricAuthenticated) async {
          LoggerX.log(
              '[PIN] entered: $code biometricAuthenticated; $biometricAuthenticated');
          Get.loading();
          final resp =
              await MbxLoginPinVM.request(phone: '', otp: '', pin: code);
          if (resp.status == 200) {
            LoggerX.log('[PIN] verfied: $code');
            MbxProfileVM.request().then((resp) {
              Get.deleteAll();
              Get.offAll(MbxBottomNavBarScreen());
            });
            return code;
          } else {
            Get.back();
            return '';
          }
        });
  }

  btnSwitchAccountClicked() {
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
