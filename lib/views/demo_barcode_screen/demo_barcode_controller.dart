import 'package:get/get.dart';

class DemoBarcodeController extends GetxController {
  var code = '';

  @override
  void onReady() {
    super.onReady();
    code = '8991234567001';
    update();
  }

  btnBackClicked() {
    Get.back();
  }
}
