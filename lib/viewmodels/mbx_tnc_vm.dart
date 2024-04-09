import '../models/mbx_tnc_model.dart';
import 'mbx_apis.dart';

class MbxTncVM {
  var loading = false;
  var tnc = MbxTncModel();

  Future<MbxApiResponse> request() {
    loading = true;
    return MbxApi.get(
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
