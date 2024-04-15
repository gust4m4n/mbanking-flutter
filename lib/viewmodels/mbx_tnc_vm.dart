import '../models/mbx_tnc_model.dart';
import '../utils/all_utils.dart';
import 'mbx_apis.dart';

class MbxTncVM {
  var loading = false;
  var tnc = MbxTncModel();

  Future<ApiXResponse> request() {
    loading = true;
    return MbxApi.post(
            endpoint: '/tnc',
            params: {},
            headers: {},
            contractFile: 'lib/contracts/MbxTncContract.json',
            contract: true)
        .then((resp) async {
      loading = false;
      if (resp.status == 200) {
        tnc = MbxTncModel.fromJason(resp.jason['data']);
      }
      return resp;
    });
  }
}
