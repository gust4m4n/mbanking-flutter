import '../../widgets/all_widgets.dart';

class MbxPulsaController extends GetxController {
  btnCloseClicked() {
    Get.back();
  }

  btnPrepaidClicked() {
    Get.back();
    Get.toNamed('/pulsa/prepaid');
  }

  btnPascabayarClicked() {
    Get.back();
    Get.toNamed('/pulsa/postpaid');
  }

  btnNonTagLisClicked() {
    Get.back();
    Get.toNamed('/electricity/nontaglis');
  }
}
