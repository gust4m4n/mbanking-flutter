import 'package:mbankingflutter/models/mbx_account_model.dart';
import 'package:mbankingflutter/models/mbx_inquiry_model.dart';
import 'package:mbankingflutter/viewmodels/mbx_electricity_token_inquiry_vm.dart';
import 'package:mbankingflutter/viewmodels/mbx_electricity_token_payment_vm.dart';
import 'package:mbankingflutter/views/mbx_inquiry_sheet/mbx_inquiry_sheet.dart';
import 'package:mbankingflutter/views/mbx_sof_sheet/mbx_sof_sheet.dart';

import '../../viewmodels/mbx_electricity_token_denoms_vm.dart';
import '../../viewmodels/mbx_profile_vm.dart';
import '../../widgets/all_widgets.dart';
import '../mbx_pin_sheet/mbx_pin_sheet.dart';

class MbxElectricityTokenController extends GetxController {
  var sof = MbxAccountModel();
  final customerIdController = TextEditingController();
  final customerIdNode = FocusNode();
  var customerIdError = '';
  int denom = 0;

  final denomsVM = MbxElectricityTokenDenomsVM();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    sof = MbxProfileVM.profile.accounts[0];
    update();
    denomsVM.request().then((resp) {
      update();
    });
  }

  btnBackClicked() {
    Get.back();
  }

  customerIdChanged(String value) {
    update();
  }

  selectDenom(int value) {
    denom = value;
    update();
  }

  btnSofClicked() {
    MbxSofSheet.show().then((sof) {
      if (sof != null) {
        this.sof = sof;
        update();
      }
    });
  }

  btnSofEyeClicked() {
    sof.visible = !sof.visible;
    update();
  }

  bool validate() {
    if (customerIdController.text.isEmpty || denom <= 0) {
      customerIdError = 'Masukkan ID pelanggan.';
      update();
      customerIdNode.requestFocus();
      return false;
    }
    customerIdError = '';
    update();

    return true;
  }

  bool readyToSubmit() {
    if (customerIdController.text.isNotEmpty && denom > 0) {
      return true;
    } else {
      return false;
    }
  }

  btnNextClicked() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (validate() == true) {
      inquiry();
    }
  }

  inquiry() {
    Get.loading();
    final inquiryVM = MbxElectricityTokenInquiryVM();
    inquiryVM.request().then((resp) {
      Get.back();
      if (resp.status == 200) {
        final sheet = MbxInquirySheet(
            title: 'Konfirmasi',
            confirmBtnTitle: 'Bayar',
            inquiry: inquiryVM.inquiry);
        sheet.show().then((value) {
          if (value == true) {
            auauthenticate(inquiry: inquiryVM.inquiry);
          }
        });
      } else {
        // inquiry request failed
      }
    });
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
    final paymentVM = MbxElectricityTokenPaymentVM();
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
