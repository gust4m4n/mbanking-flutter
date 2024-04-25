import '../../models/mbx_receipt_model.dart';
import '../../widgets/all_widgets.dart';

class MbxInquiryController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  btnCloseClicked() {
    Get.back(result: null);
  }

  btnNextClicked() {
    Get.offNamed('/receipt',
        arguments: {'receipt': MbxReceiptModel(), 'backToHome': false});
  }
}
