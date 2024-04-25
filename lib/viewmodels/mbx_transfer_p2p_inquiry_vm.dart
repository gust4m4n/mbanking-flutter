import '../models/mbx_confirm_model.dart';
import '../utils/all_utils.dart';
import 'mbx_apis.dart';

class MbxTransferP2PInquiryVM {
  var loading = false;
  List<MbxConfirmModel> list = [];

  Future<ApiXResponse> request() {
    loading = true;
    return MbxApi.post(
            endpoint: '/transfer/p2p/inquiry',
            params: {},
            headers: {},
            contractFile: 'lib/contracts/MbxTransferP2PInquiryContract.json',
            contract: true)
        .then((resp) {
      loading = false;
      if (resp.status == 200) {
        for (var item in resp.jason['data'].jasonListValue) {
          var model = MbxConfirmModel(item);
          list.add(model);
        }
      }
      return resp;
    });
  }
}
