import '../../models/mbx_transfer_p2bank_service_model.dart';
import '../../widgets/all_widgets.dart';

class MbxTransferServicePickerController extends GetxController {
  final List<MbxTransferP2BankServiceModel> list;

  MbxTransferServicePickerController(this.list) {}

  @override
  void onReady() {
    super.onReady();
  }

  btnCloseClicked() {
    Get.back();
  }
}
