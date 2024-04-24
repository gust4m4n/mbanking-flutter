import '../../viewmodels/mbx_transfer_p2p_dest_list_vm.dart';
import '../../widgets/all_widgets.dart';

class MbxTransferP2PPickerController extends GetxController {
  TextEditingController txtSearch = TextEditingController();
  var loading = true;
  var destListVM = MbxTransferP2PDestListVM();

  @override
  void onReady() {
    super.onReady();
    update();
    destListVM.nextPage().then((resp) {
      loading = false;
      destListVM.sort();
      destListVM.setFilter('');
      update();
    });
  }

  btnCloseClicked() {
    Get.back(result: null);
  }

  txtSearchChanged(String value) {
    destListVM.setFilter(value);
    update();
  }
}
