import 'package:mbankingflutter/models/mbx_confirm_model.dart';

import '../utils/all_utils.dart';
import 'mbx_apis.dart';

class MbxConfirmVM {
  var loading = false;
  List<MbxConfirmModel> list = [];

  clear() {
    list = [];
  }

  Future<ApiXResponse> nextPage() {
    loading = true;
    return MbxApi.post(
            endpoint: '/transfer/p2p/dest',
            params: {},
            headers: {},
            contractFile: 'lib/contracts/MbxConfirmContract.json',
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
