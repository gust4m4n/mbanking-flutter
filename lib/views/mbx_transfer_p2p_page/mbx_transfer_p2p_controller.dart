import 'package:mbankingflutter/viewmodels/mbx_transfer_p2p_dest_list_vm.dart';

import '../../models/mbx_qris_inquiry_model.dart';
import '../../models/mbx_transfer_p2p_dest_model.dart';
import '../../widgets/all_widgets.dart';
import '../mbx_qris_amount_screen/mbx_qris_amount_screen.dart';

class MbxTransferP2PController extends GetxController {
  final scrollController = ScrollController();
  var destListVM = MbxTransferP2PDestListVM();

  @override
  void onReady() {
    super.onReady();
    nextPage();
  }

  btnBackClicked() {
    Get.back();
  }

  nextPage() {
    if (destListVM.loading) return;
    destListVM.nextPage().then((resp) {
      update();
    });
  }

  openDest(MbxTransferP2PDestModel dest) {
    Get.to(MbxQRISAmountScreen(inquiry: MbxQRISInquiryModel()));
  }
}
