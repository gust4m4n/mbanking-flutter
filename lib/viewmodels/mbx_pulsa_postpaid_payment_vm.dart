import '../models/mbx_receipt_model.dart';
import '../utils/all_utils.dart';
import 'mbx_apis.dart';

class MbxPulsaPostpaidPaymentVM {
  var receipt = MbxReceiptModel();

  Future<ApiXResponse> request(
      {required String transaction_id,
      required String pin,
      required bool biometric}) {
    return MbxApi.post(
            endpoint: '/pulsa/postpaid/payment',
            params: {},
            headers: {},
            contractFile: 'lib/contracts/MbxPulsaPostpaidPaymentContract.json',
            contract: true)
        .then((resp) {
      if (resp.status == 200) {
        receipt = MbxReceiptModel.fromJason(resp.jason['data']);
      }
      return resp;
    });
  }
}
