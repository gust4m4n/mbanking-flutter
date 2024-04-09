import 'package:mbankingflutter/utils/all_utils.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../viewmodels/mbx_qris_inquiry_vm.dart';
import '../mbx_qris_amount_screen/mbx_qris_amount_screen.dart';

class MbxQRISController extends GetxController {
  MobileScannerController scannerController = MobileScannerController();
  var flashlight = false;
  final inquiryVM = MbxQRISInquiryVM();

  @override
  void onReady() {
    super.onReady();
  }

  btnBackClicked() {
    Get.back();
  }

  btnImageClicked() {
    QRDetected('');
  }

  btnFlashlightClicked() {
    scannerController.toggleTorch();
    flashlight = !flashlight;
    update();
  }

  QRDetected(String code) {
    LoggerX.log('QR Code: $code');
    scannerController.stop().then((value) {
      inquiryVM.request(qr_code: code).then((resp) {
        if (resp.status == 200) {
          Get.to(MbxQRISAmountScreen(inquiry: inquiryVM.inqury))?.then((value) {
            scannerController.start();
          });
        }
      });
    });
  }
}
