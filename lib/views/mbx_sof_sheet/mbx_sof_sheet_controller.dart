import '../../models/mbx_account_model.dart';
import '../../viewmodels/mbx_profile_vm.dart';
import '../../widgets/all_widgets.dart';

class MbxSofSheetController extends GetxController {
  List<MbxAccountModel> accounts = [];

  MbxSofSheetController() {
    accounts = MbxProfileVM.profile.accounts;
    for (final account in accounts) {
      account.visible = false;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  btnCloseClicked() {
    Get.back();
  }

  btnEyeClicked(int index) {
    accounts[index].visible = !accounts[index].visible;
    update();
  }
}
