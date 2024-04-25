import 'package:mbankingflutter/viewmodels/mbx_confirm_vm.dart';

import '../../models/mbx_receipt_model.dart';
import '../../widgets/all_widgets.dart';

class MbxConfirmController extends GetxController {
  TextEditingController txtSearch = TextEditingController();
  var loading = true;
  var destListVM = MbxConfirmVM();

  @override
  void onReady() {
    super.onReady();
    update();
    destListVM.nextPage().then((resp) {
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
