import 'package:pdfx/pdfx.dart';
import '../../widgets/all_widgets.dart';

class DemoPdfController extends GetxController {
  PdfController? pdfController;

  @override
  void onInit() {
    super.onInit();
    pdfController = PdfController(
      document: PdfDocument.openAsset('lib/assets/pdf_example.pdf'),
      initialPage: 1,
    );
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  btnBackClicked() {
    Get.back();
  }
}
