import '../../utils/all_utils.dart';
import '../../widgets/all_widgets.dart';

class MbxPinSheetController extends GetxController {
  final Future<String> Function(String code) onSubmit;
  String code = '';
  String error = '';

  MbxPinSheetController({required this.onSubmit});

  btnCloseClicked() {
    Get.back();
  }

  btnKeypadClicked(String digit) {
    if (code.length < 6) {
      code = code + digit;
      LoggerX.log('[PIN] typed: $code');

      update();
      if (code.length == 6) {
        onSubmit(code);
      }
    }
  }

  btnFingerprintClicked() {}

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
