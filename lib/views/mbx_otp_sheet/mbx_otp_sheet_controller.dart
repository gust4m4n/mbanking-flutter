import '../../utils/all_utils.dart';
import '../../widgets/all_widgets.dart';

class MbxOtpSheetController extends GetxController {
  final Future<String> Function(String code) onSubmit;
  String code = '';
  String error = '';

  MbxOtpSheetController({required this.onSubmit});

  btnCloseClicked() {
    Get.back();
  }

  btnKeypadClicked(String digit) {
    if (code.length < 6) {
      code = code + digit;
      LoggerX.log('[OTP] typed: $code');

      update();
      if (code.length == 6) {
        onSubmit(code);
      }
    }
  }

  btnBackspaceClicked() {
    if (code.length > 0) {
      code = code.substring(0, code.length - 1);
      update();
    }
  }

  btnResendClicked() async {
    //await onResend();
    clear('');
    update();
  }

  clear(String error) {
    code = '';
    this.error = error;
    update();
  }
}
