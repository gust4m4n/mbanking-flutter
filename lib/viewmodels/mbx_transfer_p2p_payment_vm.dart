import '../models/mbx_receipt_model.dart';
import '../utils/all_utils.dart';
import 'mbx_apis.dart';

class MbxTransferP2PPaymentVM {
  var receipt = MbxReceiptModel();

  Future<ApiXResponse> request(
      {required String transaction_id,
      required String pin,
      required bool biometric}) {
    return MbxApi.post(
            endpoint: '/transfer/p2p/payment',
            params: {},
            headers: {},
            contractFile: 'lib/contracts/MbxTransferP2PPaymentContract.json',
            contract: true)
        .then((resp) {
      if (resp.status == 200) {
        receipt = MbxReceiptModel.fromJason(resp.jason['data']);
      }
      return resp;
    });
  }
}
