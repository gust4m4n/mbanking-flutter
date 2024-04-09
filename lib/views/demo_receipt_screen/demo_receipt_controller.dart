import '../../widgets/all_widgets.dart';

class DemoReceiptController extends GetxController {
  Map<String, String> details = {};
  ScreenshotController screenshotController = ScreenshotController();

  DemoReceiptController({required this.details});

  @override
  void onReady() {
    super.onReady();
  }

  btnBackClicked() {
    Get.back();
  }

  btnShareClicked() {
    screenshotController
        .capture(delay: Duration(milliseconds: 0))
        .then((capturedImage) async {
      Share.shareXFiles([
        XFile.fromData(capturedImage!,
            mimeType: 'image/png', name: 'receipt.png')
      ]);
    }).catchError((onError) {});
  }
}
