import '../../widgets/all_widgets.dart';

class MbxLauncherController extends GetxController {
  btnCloseClicked() {
    Get.back();
  }

  btnElectricityTokenClicked() {
    Get.back();
    Get.toNamed('/electricity/prepaid');
  }

  btnPascabayarClicked() {
    Get.back();
    Get.toNamed('/electricity/postpaid');
  }

  btnNonTagLisClicked() {
    Get.back();
    Get.toNamed('/electricity/nontaglis');
  }
}
