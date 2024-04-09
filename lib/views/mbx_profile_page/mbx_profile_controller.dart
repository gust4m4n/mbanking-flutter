import 'package:mbankingflutter/views/mbx_tnc_screen/mbx_tnc_screen.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../viewmodels/mbx_logout_vm.dart';
import '../../viewmodels/mbx_profile_vm.dart';
import '../../widgets/all_widgets.dart';
import '../mbx_privacy_policy_screen/mbx_privacy_policy_screen.dart';

class MbxProfileController extends GetxController {
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
  }

  toggleBiometric(bool value) {
    MbxProfileVM.profile.biometric = value;
    update();
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
