import '../../viewmodels/mbx_news_list_vm.dart';
import '../../viewmodels/mbx_profile_vm.dart';
import '../../viewmodels/mbx_theme_vm.dart';
import '../../widgets/all_widgets.dart';
import '../mbx_relogin_screen/mbx_relogin_screen.dart';

class MbxHomeController extends GetxController {
  final scrollController = ScrollController();
  var newsListVM = MbxNewsListVM();
  var pageIndex = 0;

  @override
  void onReady() {
    super.onReady();
    newsListVM.nextPage().then((resp) {
      if (resp.status == 200) {
        update();
      }
    });
  }

  btnThemeClicked() {
    MbxThemeVM.change().then((value) {
      update();
    });
  }

  btnLockClicked() {
    Get.deleteAll();
    Get.offAll(MbxReloginScreen());
  }

  btnEyeClicked(int index) {
    MbxProfileVM.profile.accounts[index].visible =
        !MbxProfileVM.profile.accounts[index].visible;
    update();
  }

  btnBackClicked() {
    Get.back();
  }

  setPageIndex(int index) {
    pageIndex = index;
  }
}
