import '../../../utils/all_utils.dart';
import '../../viewmodels/mbx_profile_vm.dart';
import '../../widgets/all_widgets.dart';
import '../mbx_qris_screen/mbx_qris_screen.dart';

class MbxBottomNavBarController extends SuperController {
  int tabBarIndex = 0;
  MbxBottomNavBarController({this.tabBarIndex = 0});

  @override
  void onReady() {
    super.onReady();
    StatusBarX.setDark();
    MbxProfileVM.request().then((resp) {
      update();
    });
  }

  @override
  void onDetached() {
    LoggerX.log('[MbxBottomNavBarController] onDetached');
  }

  @override
  void onInactive() {
    LoggerX.log('[MbxBottomNavBarController] onInactive');
  }

  @override
  void onPaused() {
    LoggerX.log('[MbxBottomNavBarController] onPaused');
  }

  @override
  Future<void> onResumed() async {
    LoggerX.log('[MbxBottomNavBarController] onResumed');
    //await MbxAntiJailbreakVM.check();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onChange(int index) {
    LoggerX.log('MbxBottomNavBarController.onChange: $index');
    tabBarIndex = index;

    switch (index) {
      case 0: // Beranda
        StatusBarX.setLight();
        //final HomeController controller = Get.find();
        //controller.reloadAll();
        update();
        break;
      case 1: // Riwayat
        StatusBarX.setLight();
        update();
        break;
      case 2: // QRIS
        Get.to(MbxQRISScreen());
        break;
      case 3: // Notifikasi
        StatusBarX.setLight();
        update();
        break;
      case 4: // Akun
        StatusBarX.setLight();
        update();
        break;
    }
  }

  btnHomeClicked() {
    tabBarIndex = 0;
    StatusBarX.setLight();
    update();
  }

  btnHistoryClicked() {
    tabBarIndex = 1;
    StatusBarX.setLight();
    update();
  }

  btnQRISClicked() {
    StatusBarX.setLight();
    Get.to(MbxQRISScreen());
    update();
  }

  btnNotificationsClicked() {
    tabBarIndex = 3;
    StatusBarX.setLight();
    update();
  }

  btnAccountClicked() {
    tabBarIndex = 4;
    StatusBarX.setLight();
    update();
  }

  @override
  void onHidden() {}
}
