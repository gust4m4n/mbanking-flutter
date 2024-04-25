import 'package:mbankingflutter/viewmodels/mbx_transfer_p2p_inquiry_vm.dart';

import '../../models/mbx_receipt_model.dart';
import '../../widgets/all_widgets.dart';

class MbxInquiryController extends GetxController {
  TextEditingController txtSearch = TextEditingController();
  var loading = true;
  var inquiryVM = MbxTransferP2PInquiryVM();

  @override
  void onReady() {
    super.onReady();
    update();
    inquiryVM.request().then((resp) {
      loading = false;
      update();
    });
  }

  btnCloseClicked() {
    Get.back(result: null);
  }

  btnNextClicked() {
    Get.offNamed('/receipt',
        arguments: {'receipt': MbxReceiptModel(), 'backToHome': false});
  }
}
