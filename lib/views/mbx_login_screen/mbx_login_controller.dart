import 'package:mbankingflutter/views/mbx_pin_sheet/mbx_pin_sheet.dart';
import 'package:mbankingflutter/widgets/all_widgets.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../utils/all_utils.dart';
import '../../viewmodels/mbx_login_otp_vm.dart';
import '../../viewmodels/mbx_login_phone_vm.dart';
import '../../viewmodels/mbx_login_pin_vm.dart';
import '../../viewmodels/mbx_onboarding_list_vm.dart';
import '../../viewmodels/mbx_profile_vm.dart';
import '../../viewmodels/mbx_theme_vm.dart';
import 'mbx_login_screen.dart';

class MbLoginController extends GetxController {
  final PageController pageController = PageController();
  var onboardingVM = MbxOnboardingListVM();
  final txtPhoneController = TextEditingController();
  final txtPhoneNode = FocusNode();
  var txtPhoneError = '';
  var loginEnabled = false;
  var version = '';
  var pageIndex = 0;

  @override
  void onReady() {
    super.onReady();
    PackageInfo.fromPlatform().then((info) {
      version = 'Version ${info.version}.${info.buildNumber}';
      update();
    });

    onboardingVM.nextPage().then((resp) {
      if (resp.status == 200) {
        update();
      }
    });
  }

  btnThemeClicked() {
    MbxThemeVM.change().then((value) {
      if (value) {
        Get.offAllNamed('/login');
      }
    });
  }

  txtPhoneOnChanged(String value) {
    loginEnabled = !value.isEmpty;
    update();
  }

  btnStartClicked() {
    Get.to(MbxLoginScreen());
  }

  setPageIndex(int index) {
    pageIndex = index;
    update();
  }

  btnLoginClicked() {
    FocusManager.instance.primaryFocus?.unfocus();
    txtPhoneError = '';
    update();

    if (txtPhoneController.text.trim().isEmpty) {
      txtPhoneError = 'Nomor handphone tidak boleh kosong.';
      FocusScope.of(Get.context!).requestFocus(txtPhoneNode);
      update();
      return;
    }

    Get.loading();
    MbxLoginPhoneVM.request(phone: txtPhoneController.text).then((resp) {
      Get.back();
      if (resp.status == 200) {
        askOtp(txtPhoneController.text);
      } else {
        SheetX.showMessage(
          title: 'Login',
          message: resp.message,
          leftBtnTitle: 'OK',
          onLeftBtnClicked: () {
            Get.back();
          },
        );
      }
    });
  }

  askOtp(String phone) {
    final pinSheet = MbxPinSheet();
    pinSheet
        .show(
      title: 'OTP',
      description: 'Masukkan kode OTP yang anda terima melalui SMS.',
      secure: false,
      biometric: false,
      onSubmit: (code, biometric) async {
        LoggerX.log('[OTP] entered: $code');
        Get.loading();
        final resp = await MbxLoginOtpVM.request(phone: phone, otp: code);
        Get.back();
        if (resp.status == 200) {
          LoggerX.log('[OTP] verfied: $code');
          Get.back();
          Get.loading();
          Future.delayed(const Duration(milliseconds: 500), () {
            Get.back();
            askPin(phone, code);
          });
        } else {}
      },
      optionTitle: 'Kirim Ulang',
      onOption: () {},
    )
        .then((code) {
      if (code != null && (code as String).isNotEmpty) {
        LoggerX.log('[OTP] verfied: $code');
        askPin(phone, code);
      }
    });
  }

  askPin(String phone, String otp) {
    final pinSheet = MbxPinSheet();
    pinSheet.show(
      title: 'PIN',
      description: 'Masukkan nomor pin m-banking atau ATM anda.',
      secure: true,
      biometric: false,
      onSubmit: (code, biometric) async {
        LoggerX.log('[PIN] entered: $code');
        Get.loading();
        final resp = await MbxLoginPinVM.request(phone: '', otp: '', pin: code);
        if (resp.status == 200) {
          LoggerX.log('[PIN] verfied: $code');
          MbxProfileVM.request().then((resp) {
            Get.toNamed('/home');
          });
        } else {
          Get.back();
        }
      },
      optionTitle: 'Lupa PIN',
      onOption: () {},
    );
  }
}
