import '../../widgets/all_widgets.dart';

class MbxSofSheetController extends GetxController {
  String code = '';
  String error = '';

  MbxSofSheetController();

  btnCloseClicked() {
    Get.back();
  }


}
