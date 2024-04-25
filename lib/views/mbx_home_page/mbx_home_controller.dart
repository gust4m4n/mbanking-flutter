import '../../viewmodels/mbx_news_list_vm.dart';
import '../../viewmodels/mbx_profile_vm.dart';
import '../../viewmodels/mbx_theme_vm.dart';
import '../../widgets/all_widgets.dart';

class MbxHomeController extends GetxController {
  final scrollController = ScrollController();

  @override
  void onReady() {
    super.onReady();
    MbxNewsListVM.request().then((resp) {
      if (resp.status == 200) {
        update();
      }
    });
  }

  btnThemeClicked() {
    MbxThemeVM.change().then((value) {
      if (value) {
        Get.offAllNamed('/home');
      }
    });
  }

  btnLockClicked() {
    Get.toNamed('/relogin', arguments: {'autologin': false});
  }

  btnEyeClicked(int index) {
    MbxProfileVM.profile.accounts[index].visible =
        !MbxProfileVM.profile.accounts[index].visible;
    update();
  }

  btnBackClicked() {
    Get.back();
  }

  btnTransferClicked() {
    Get.toNamed('/transfer');
  }
}
