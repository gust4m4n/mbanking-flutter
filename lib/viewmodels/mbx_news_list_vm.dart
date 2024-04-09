import 'dart:async';
import '../models/mbx_news_model.dart';
import 'mbx_apis.dart';

class MbxNewsListVM {
  var loading = false;
  List<MbxNewsModel> list = [];
  List<MbxNewsModel> filtered = [];

  clear() {
    list = [];
  }

  Future<MbxApiResponse> nextPage() {
    loading = true;
    return MbxApi.get(
            endpoint: '/news/list',
            params: {},
            headers: {},
            contractFile: 'lib/contracts/MbxNewsListContract.json',
            contract: true)
        .then((resp) async {
      loading = false;
      if (resp.status == 200) {
        for (var item in resp.jason['data'].jasonListValue) {
          var movie = MbxNewsModel.fromJason(item);
          list.add(movie);
        }
      }
      return resp;
    });
  }

  sort() {
    list.sort((a, b) => a.title.compareTo(b.title));
  }

  setFilter(String keyword) {
    filtered = [];
    for (var item in list) {
      if (keyword.isEmpty) {
        filtered.add(item);
      } else {
        if (item.title.toLowerCase().contains(keyword.toLowerCase())) {
          filtered.add(item);
        }
      }
    }
  }
}
