import 'package:mbankingflutter/models/mbx_transfer_p2p_dest_model.dart';
import 'package:mbankingflutter/utils/all_utils.dart';

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

  onDeleteClicked(MbxTransferP2PDestModel dest) {
    SheetX.showMessage(
        title: 'Hapus',
        message:
            'Apakah anda yakin ingin menghapus ${dest.name} dengan nomor rekening ${dest.account} ?',
        leftBtnTitle: 'Ya',
        onLeftBtnClicked: () {
          Get.back();
        },
        rightBtnTitle: 'Tidak',
        onRightBtnClicked: () {
          Get.back();
        });
  }

  onAddClicked() {
    LoggerX.log('test');
    //Get.toNamed('/mbx_transfer_p2p_dest_add');
  }
}
