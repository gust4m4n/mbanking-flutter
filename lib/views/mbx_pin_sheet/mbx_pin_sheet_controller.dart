import '../../viewmodels/mbx_biometric_vm.dart';
import '../../viewmodels/mbx_preferences_vm+users.dart';
import '../../widgets/all_widgets.dart';

class MbxPinSheetController extends GetxController {
  final void Function(String code, bool biometric) onSubmit;
  String code = '';
  String error = '';
  bool biometricEnabled = false;

  MbxPinSheetController({required this.onSubmit});

  @override
  void onReady() {
    super.onReady();
    btnBiometricClicked();
  }

  btnCloseClicked() {
    Get.back();
  }

  btnKeypadClicked(String digit) {
    if (code.length < 6) {
      code = code + digit;
      update();
      if (code.length == 6) {
        onSubmit(code, false);
      }
    }
  }

  btnBiometricClicked() {
    MbxUserPreferencesVM.getBiometricEnabled().then((value) {
      biometricEnabled = value;
      update();
      if (value) {
        MbxBiometricVM.available().then((available) {
          if (available) {
            MbxBiometricVM.authenticate().then((authenticated) {
              if (authenticated == true) {
                onSubmit('', true);
              }
            });
          }
        });
      }
    });
  }

  btnBackspaceClicked() {
    if (code.length > 0) {
      code = code.substring(0, code.length - 1);
      update();
    }
  }

  btnForgotClicked() {}

  clear(String error) {
    code = '';
    this.error = error;
    update();
  }
}
