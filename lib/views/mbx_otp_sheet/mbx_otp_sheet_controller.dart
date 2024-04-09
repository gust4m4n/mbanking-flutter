import '../../widgets/all_widgets.dart';

class MbxOtpSheetController extends GetxController {
  final Future<bool> Function(String code) onSubmit;
  final Future<void> Function() onResend;
  String code = '';
  String error = '';

  MbxOtpSheetController({required this.onSubmit, required this.onResend});

  btnCloseClicked() {
    Get.back();
  }

  btnKeypadClicked(String digit) async {
    if (code.length < 6) {
      code = code + digit;
      if (code.length == 6) {
        update();
        final result = await onSubmit(code);
        if (result == true) {
          Get.back(result: code);
        } else {
          clear(error);
        }
      }
    }
    update();
  }

  btnBackspaceClicked() {
    if (code.length > 0) {
      code = code.substring(0, code.length - 1);
    }
    update();
  }

  btnResendClicked() async {
    await onResend();
    clear('');
    update();
  }

  clear(String error) {
    code = '';
    this.error = error;
    update();
  }
}
