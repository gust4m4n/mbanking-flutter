import 'package:mbankingflutter/utils/all_utils.dart';
import 'package:mbankingflutter/viewmodels/mbx_device_info_vm.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../viewmodels/mbx_qris_inquiry_vm.dart';
import '../../widgets/all_widgets.dart';
import '../mbx_qris_amount_screen/mbx_qris_amount_screen.dart';

class MbxQRISController extends GetxController {
  MobileScannerController? scannerController;
  var flashlight = false;
  final inquiryVM = MbxQRISInquiryVM();

  @override
  void onReady() {
    super.onReady();
    if (MbxDeviceInfoVM.simulator == false) {
      scannerController = MobileScannerController();
    }
  }

  btnBackClicked() {
    Get.back();
  }

  btnImageClicked() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
        maxWidth: 1024.0,
        maxHeight: 1024.0,
        preferredCameraDevice: CameraDevice.front);
    if (pickedFile != null) {
      inquiryVM.request(qr_code: '').then((resp) {
        if (resp.status == 200) {
          Get.to(MbxQRISAmountScreen(inquiry: inquiryVM.inqury))?.then((value) {
            scannerController?.start();
          });
        }
      });
    }
  }

  btnFlashlightClicked() {
    scannerController?.toggleTorch();
    flashlight = !flashlight;
    update();
  }

  QRDetected(String code) {
    LoggerX.log('QR Code: $code');
    scannerController?.stop().then((value) {
      inquiryVM.request(qr_code: code).then((resp) {
        if (resp.status == 200) {
          Get.to(MbxQRISAmountScreen(inquiry: inquiryVM.inqury))?.then((value) {
            scannerController?.start();
          });
        }
      });
    });
  }
}
