import 'package:mbankingflutter/views/mbx_transfer_p2p_picker/mbx_transfer_p2p_picker.dart';

import '../../models/mbx_receipt_model.dart';
import '../../widgets/all_widgets.dart';

class MbxTransfeP2PrController extends GetxController {
  final txtAccountController = TextEditingController();
  final txtAccountNode = FocusNode();
  final txtAmountController = TextEditingController();
  final txtAmountNode = FocusNode();
  final txtMessageController = TextEditingController();
  final txtMessageNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    update();
  }

  btnBackClicked() {
    Get.back();
  }

  btnPickDestinationClicked() {
    final picker = MbxTransferP2PPicker();
    picker.show().then((value) {
      if (value != null) {}
    });
  }

  btnNextClicked() {
    Get.toNamed('/receipt',
        arguments: {'receipt': MbxReceiptModel(), 'backToHome': false});
  }
}
