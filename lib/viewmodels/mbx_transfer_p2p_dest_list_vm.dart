import '../models/mbx_transfer_p2p_dest_model.dart';
import '../utils/all_utils.dart';
import 'mbx_apis.dart';

class MbxTransferP2PDestListVM {
  var loading = false;
  List<MbxTransferP2PDestModel> list = [];

  Future<ApiXResponse> nextPage() {
    loading = true;
    return MbxApi.get(
            endpoint: '/transfer/p2p/dest',
            params: {},
            headers: {},
            contractFile: 'lib/contracts/MbxTransferP2PDestListContract.json',
            contract: true)
        .then((resp) {
      loading = false;
      if (resp.status == 200) {
        for (var item in resp.jason['data'].jasonListValue) {
          var dest = MbxTransferP2PDestModel.fromJason(item);
          list.add(dest);
        }
      }
      return resp;
    });
  }
}
