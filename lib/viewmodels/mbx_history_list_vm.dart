import '../models/mbx_history_model.dart';
import 'mbx_apis.dart';

class MbxHistoryListVM {
  var loading = false;
  List<MbxHistoryModel> list = [];

  clear() {
    list = [];
  }

  Future<MbxApiResponse> nextPage() {
    loading = true;
    return MbxApi.get(
            endpoint: '/history',
            params: {},
            headers: {},
            contractFile: 'lib/contracts/MbxHistoryListContract.json',
            contract: true)
        .then((resp) async {
      loading = false;
      if (resp.status == 200) {
        for (var item in resp.jason['data'].jasonListValue) {
          var history = MbxHistoryModel(item);
          list.add(history);
        }
      }
      return resp;
    });
  }
}
