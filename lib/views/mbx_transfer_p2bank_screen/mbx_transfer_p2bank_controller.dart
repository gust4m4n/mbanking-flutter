import 'package:intl/intl.dart';
import 'package:mbankingflutter/models/mbx_account_model.dart';
import 'package:mbankingflutter/models/mbx_inquiry_model.dart';
import 'package:mbankingflutter/models/mbx_transfer_p2bank_service_model.dart';
import 'package:mbankingflutter/views/mbx_inquiry_sheet/mbx_inquiry_sheet.dart';
import 'package:mbankingflutter/views/mbx_sof_sheet/mbx_sof_sheet.dart';
import 'package:mbankingflutter/views/mbx_transfer_p2bank_picker/mbx_transfer_p2bank_picker.dart';
import 'package:mbankingflutter/views/mbx_transfer_service_picker/mbx_transfer_service_picker.dart';

import '../../models/mbx_transfer_p2bank_dest_model.dart';
import '../../viewmodels/mbx_profile_vm.dart';
import '../../viewmodels/mbx_transfer_p2bank_inquiry_vm.dart';
import '../../viewmodels/mbx_transfer_p2bank_payment_vm.dart';
import '../../widgets/all_widgets.dart';
import '../mbx_pin_sheet/mbx_pin_sheet.dart';

class MbxTransfeP2BankController extends GetxController {
  final txtAccountController = TextEditingController();
  final txtAccountNode = FocusNode();
  final txtAmountController = TextEditingController();
  final txtAmountNode = FocusNode();
  final txtMessageController = TextEditingController();
  final txtMessageNode = FocusNode();
  var dest = MbxTransferP2BankDestModel();
  int amount = 0;
  var service = MbxTransferP2BankServiceModel();
  var sof = MbxAccountModel();
  final transferServicePicker = MbxTransferServicePicker();

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

  btnPickDestinationClicked() {
    final picker = MbxTransferP2BankPicker();
    picker.show().then((value) {
      if (value != null) {
        dest = value;
        update();
      }
    });
  }

  btnClearClicked() {
    dest = MbxTransferP2BankDestModel();
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

  btnTransferServiceClicked() {
    transferServicePicker.show().then((service) {
      if (service != null) {
        this.service = service;
        update();
      }
    });
  }

  btnSofClicked() {
    MbxSofSheet.show().then((sof) {
      if (sof != null) {
        this.sof = sof;
        update();
      }
    });
  }

  btnEyeClicked() {
    sof.visible = !sof.visible;
    update();
  }

  btnNextClicked() {
    inquiry();
  }

  inquiry() {
    Get.loading();
    final inquiryVM = MbxTransferP2BankInquiryVM();
    inquiryVM.request().then((resp) {
      Get.back();
      if (resp.status == 200) {
        final sheet = MbxInquirySheet(
            title: 'Konfirmasi',
            confirmBtnTitle: 'Transfer',
            inquiry: inquiryVM.inquiry);
        sheet.show().then((value) {
          if (value == true) {
            security(inquiry: inquiryVM.inquiry);
          }
        });
      } else {
        // inquiry request failed
      }
    });
  }

  security({required MbxInquiryModel inquiry}) {
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
        ToastX.show(msg: 'PIN akan direset, silahkan hubungi CS kami.');
      },
    );
  }

  payment(
      {required String transaction_id,
      required String pin,
      required bool biometric}) {
    Get.loading();
    final paymentVM = MbxTransferP2BankPaymentVM();
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
