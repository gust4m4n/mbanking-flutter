import 'package:intl/intl.dart';
import 'package:mbankingflutter/models/mbx_transfer_p2p_dest_model.dart';
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
  var dest = MbxTransferP2PDestModel();
  int amount = 0;

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
      if (value != null) {
        dest = value;
        update();
      }
    });
  }

  btnClearClicked() {
    dest = MbxTransferP2PDestModel();
    update();
  }

  txtAmountChanged(String value) {
    String newValue = value.replaceAll('.', '');
    int? intValue = int.tryParse(newValue);
    if (intValue != null) {
      amount = intValue;
      final formatter = NumberFormat('#,###');
      String formatted = formatter.format(intValue).replaceAll(',', '.');
      txtAmountController.text = formatted;
      txtAmountController.selection =
          TextSelection.fromPosition(TextPosition(offset: formatted.length));
    } else {
      amount = 0;
      txtAmountController.text = '';
    }
    update();
  }

  btnNextClicked() {
    Get.toNamed('/receipt',
        arguments: {'receipt': MbxReceiptModel(), 'backToHome': false});
  }
}