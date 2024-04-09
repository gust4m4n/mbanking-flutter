import 'package:mbankingflutter/viewmodels/mbx_profile_vm.dart';
import 'package:mbankingflutter/viewmodels/mbx_qris_payment_vm.dart';
import 'package:mbankingflutter/views/mbx_sof_sheet/mbx_sof_sheet.dart';
import 'package:intl/intl.dart';

import '../../models/mbx_account_model.dart';
import '../../models/mbx_qris_inquiry_model.dart';
import '../../viewmodels/mbx_receipt_vm.dart';
import '../../widgets/all_widgets.dart';
import '../mbx_receipt_screen/mbx_receipt_screen.dart';

class MbxQRISAmountController extends GetxController {
  final MbxQRISInquiryModel inquiry;
  final txtAmountController = TextEditingController();
  final txtAmountNode = FocusNode();
  var receiptVM = MbxReceiptVM();
  var account = MbxAccountModel();
  int amount = 0;

  MbxQRISAmountController({required this.inquiry});

  @override
  void onReady() {
    super.onReady();
    account = MbxProfileVM.profile.accounts[0];
    update();
    txtAmountNode.requestFocus();
  }

  btnBackClicked() {
    Get.back();
  }

  btnSofClicked() {
    MbxSofSheet.show(
      title: 'SUMBER DANA',
      description: 'Masukkan kode OTP yang anda terima melalui SMS.',
      onSubmit: (code) {
        return Future.value(true);
      },
      onResend: () async {},
    ).then((account) {
      if (account != null) {
        this.account = account;
        update();
      }
    });
  }

  txtAmountOnChanged(String value) {
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
    FocusManager.instance.primaryFocus?.unfocus();
    Get.loading();
    final qrisPaymentVM = MbxQRISPaymentVM();
    qrisPaymentVM.request(transaction_i: inquiry.transaction_id).then((resp) {
      Get.back();
      if (resp.status == 200) {
        Get.to((MbxReceiptScreen(
            receipt: qrisPaymentVM.receipt, backToHome: true)));
      }
    });
  }
}
