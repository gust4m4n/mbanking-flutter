import '../../viewmodels/mbx_profile_vm.dart';
import '../../widgets/all_widgets.dart';

class MbxSofSheetController extends GetxController {
  String code = '';
  String error = '';

  MbxSofSheetController();

  btnCloseClicked() {
    Get.back();
  }

  btnEyeClicked(int index) {
    MbxProfileVM.profile.accounts[index].visible =
        !MbxProfileVM.profile.accounts[index].visible;
    update();
  }
}
