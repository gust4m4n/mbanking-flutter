import '../models/mbx_privacy_policy_model.dart';
import 'mbx_apis.dart';

class MbxPrivacyPolicyVM {
  var loading = false;
  var privacy_policy = MbxPrivacyPolicyModel();

  Future<MbxApiResponse> request() {
    loading = true;
    return MbxApi.get(
            endpoint: '/privacy-policy',
            params: {},
            headers: {},
            contractFile: 'lib/contracts/MbxPrivacyPolicyContract.json',
            contract: true)
        .then((resp) async {
      loading = false;
      if (resp.status == 200) {
        privacy_policy = MbxPrivacyPolicyModel.fromJason(resp.jason['data']);
      }
      return resp;
    });
  }
}
