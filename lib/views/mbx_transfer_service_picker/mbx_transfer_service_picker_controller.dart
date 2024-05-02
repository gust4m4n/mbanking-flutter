import 'package:mbankingflutter/viewmodels/mbx_transfer_p2bank_service_list_vm.dart';

import '../../widgets/all_widgets.dart';

class MbxTransferServicePickerController extends GetxController {
  final transferServiceListVM = MbxTransferP2BankServiceListVM();

  MbxTransferServicePickerController() {}

  @override
  void onReady() {
    super.onReady();
    transferServiceListVM.request().then((resp) {
      if (resp.status == 200) {
        update();
      }
    });
  }

  btnCloseClicked() {
    Get.back();
  }
}
