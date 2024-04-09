import '../models/mbx_qris_inquiry_model.dart';
import 'mbx_apis.dart';

class MbxQRISInquiryVM {
  var loading = false;
  var inqury = MbxQRISInquiryModel();

  Future<MbxApiResponse> request({required String qr_code}) {
    loading = true;
    final params = {'qr_code': qr_code};
    return MbxApi.post(
            endpoint: '/qris/inquiry',
            params: params,
            headers: {},
            contractFile: 'lib/contracts/MbxQRISInquiryContract.json',
            contract: true)
        .then((resp) async {
      loading = false;
      if (resp.status == 200) {
        inqury = MbxQRISInquiryModel.fromJason(resp.jason['data']);
      }
      return resp;
    });
  }
}
