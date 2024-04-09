import '../../../utils/all_utils.dart';
import '../../viewmodels/mbx_anti_jailbreak_vm.dart';
import '../../widgets/all_widgets.dart';

class DemoBottomNavBarController extends SuperController {
  int tabBarIndex = 0;
  DemoBottomNavBarController({this.tabBarIndex = 0});

  @override
  void onReady() {
    super.onReady();
    StatusBarX.setDark();
  }

  @override
  void onDetached() {
    LoggerX.log('[DemoBottomNavBarController] onDetached');
  }

  @override
  void onInactive() {
    LoggerX.log('[DemoBottomNavBarController] onInactive');
  }

  @override
  void onPaused() {
    LoggerX.log('[DemoBottomNavBarController] onPaused');
  }

  @override
  Future<void> onResumed() async {
    LoggerX.log('[DemoBottomNavBarController] onResumed');
    await MbxAntiJailbreakVM.check();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onChange(int index) {
    LoggerX.log('DemoBottomNavBarController.onChange: $index');
    tabBarIndex = index;
    update();

    switch (index) {
      case 0:
        StatusBarX.setLight();
        //final HomeController controller = Get.find();
        //controller.reloadAll();
        break;
      case 1:
        StatusBarX.setLight();
        break;
      case 2:
        StatusBarX.setLight();
        break;
    }
  }

  @override
  void onHidden() {}
}
