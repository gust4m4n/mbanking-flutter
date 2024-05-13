import 'package:mbankingflutter/models/mbx_account_model.dart';
import 'package:mbankingflutter/models/mbx_inquiry_model.dart';

import '../../viewmodels/mbx_profile_vm.dart';
import '../../viewmodels/mbx_transfer_p2p_payment_vm.dart';
import '../../widgets/all_widgets.dart';
import '../mbx_pin_sheet/mbx_pin_sheet.dart';

class MbxCardlessInstructionsController extends GetxController {
  var sof = MbxAccountModel();

  final amountController = TextEditingController();
  final amountNode = FocusNode();
  var amountError = '';
  int amount = 0;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    sof = MbxProfileVM.profile.accounts[0];

    update();
  }

  btnBackClicked() {
    Get.back();
  }

  btnFinishClicked() {
    Get.offAllNamed('/home');
  }

  auauthenticate({required MbxInquiryModel inquiry}) {
    final pinSheet = MbxPinSheet();
    pinSheet.show(
      title: 'PIN',
      message: 'Masukkan nomor pin m-banking atau ATM anda.',
      secure: true,
      biometric: true,
      onSubmit: (code, biometric) async {
        payment(transaction_id: code, pin: code, biometric: biometric);
      },
      optionTitle: 'Lupa PIN',
      onOption: () {
        pinSheet.clear('');
        ToastX.showSuccess(msg: 'PIN akan direset, silahkan hubungi CS kami.');
      },
    );
  }

  payment(
      {required String transaction_id,
      required String pin,
      required bool biometric}) {
    Get.loading();
    final paymentVM = MbxTransferP2PPaymentVM();
    paymentVM
        .request(transaction_id: transaction_id, pin: pin, biometric: biometric)
        .then((resp) {
      if (resp.status == 200) {
        Get.back();
        Get.offNamed('/receipt',
            arguments: {'receipt': paymentVM.receipt, 'backToHome': true});
      } else {
        // payment request failed
      }
    });
  }
}
