import 'package:mbankingflutter/viewmodels/mbx_transfer_p2p_dest_list_vm.dart';
import '../../widgets/all_widgets.dart';

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
}
