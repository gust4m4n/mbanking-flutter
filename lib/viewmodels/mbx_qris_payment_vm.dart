import '../models/mbx_receipt_model.dart';
import '../utils/all_utils.dart';
import 'mbx_apis.dart';

class MbxQRISPaymentVM {
  var loading = false;
  var receipt = MbxReceiptModel();

  Future<ApiXResponse> request({required String transaction_i}) {
    loading = true;
    final params = {'transaction_i': transaction_i};
    return MbxApi.post(
            endpoint: '/qris/payment',
            params: params,
            headers: {},
            contractFile: 'lib/contracts/MbxQRISPaymentContract.json',
            contract: true)
        .then((resp) async {
      loading = false;
      if (resp.status == 200) {
        receipt = MbxReceiptModel.fromJason(resp.jason['data']);
      }
      return resp;
    });
  }
}
