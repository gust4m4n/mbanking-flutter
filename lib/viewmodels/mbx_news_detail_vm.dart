import '../models/mbx_news_model.dart';
import 'mbx_apis.dart';

class MbxNewsDetailVM {
  var loading = false;
  var news = MbxNewsModel();

  Future<MbxApiResponse> request() {
    loading = true;
    return MbxApi.get(
            endpoint: '/news/detail',
            params: {},
            headers: {},
            contractFile: 'lib/contracts/MbxNewsDetailContract.json',
            contract: true)
        .then((resp) async {
      loading = false;
      if (resp.status == 200) {
        news = MbxNewsModel.fromJason(resp.jason['data']);
      }
      return resp;
    });
  }
}
