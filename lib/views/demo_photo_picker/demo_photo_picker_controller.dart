import '../../widgets/all_widgets.dart';

class AppxPhotoPickerController extends GetxController {
  btnCloseClicked() {
    Get.back(result: '');
  }

  btnCameraClicked() {
    Get.back(result: 'camera');
  }

  btnGalleryClicked() {
    Get.back(result: 'gallery');
  }

  btnCancelClicked() {
    Get.back(result: '');
  }
}
