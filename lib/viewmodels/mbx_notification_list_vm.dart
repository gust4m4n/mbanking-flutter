import '../models/mbx_notification_model.dart';
import '../utils/all_utils.dart';
import 'mbx_apis.dart';

class MbxNotificationVM {
  var loading = false;
  List<MbxNotificationModel> list = [];

  clear() {
    list = [];
  }

  Future<ApiXResponse> nextPage() {
    loading = true;
    return MbxApi.get(
            endpoint: '/notification',
            params: {},
            headers: {},
            contractFile: 'lib/contracts/MbxNotificationListContract.json',
            contract: true)
        .then((resp) async {
      loading = false;
      if (resp.status == 200) {
        for (var item in resp.jason['data'].jasonListValue) {
          var history = MbxNotificationModel(item);
          list.add(history);
        }
      }
      return resp;
    });
  }
}
