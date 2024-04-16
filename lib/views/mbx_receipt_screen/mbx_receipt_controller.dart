import '../../models/mbx_receipt_model.dart';
import '../../viewmodels/mbx_receipt_vm.dart';
import '../../widgets/all_widgets.dart';
import '../mbx_bottom_navbar_screen/mbx_bottom_navbar_screen.dart';

class MbxReceiptController extends GetxController {
  var receipt = MbxReceiptModel();
  var loading = false;
  final bool backToHome;

  MbxReceiptController({required this.receipt, required this.backToHome});

  @override
  void onReady() {
    super.onReady();
    if (receipt.transaction_id.isEmpty) {
      loading = true;
      update();
      final receiptVM = MbxReceiptVM();
      receiptVM.request(transaction_i: receipt.transaction_id).then((resp) {
        receipt = receiptVM.receipt;
        loading = false;
        update();
      });
    }
  }

  btnBackClicked() async {
    if (backToHome) {
      await Get.deleteAll();
      await Get.offAll(MbxBottomNavBarScreen());
    } else {
      Get.back();
    }
  }
}
