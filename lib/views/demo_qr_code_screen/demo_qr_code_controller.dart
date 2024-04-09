import 'package:get/get.dart';

class DemoQRCodeController extends GetxController {
  var code = '';

  @override
  void onReady() {
    super.onReady();
    code = 'Hello world!';
    update();
  }

    btnBackClicked() {
    Get.back();
  }

}
