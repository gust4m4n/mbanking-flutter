import 'dart:async';
import 'package:mbankingflutter/utils/all_utils.dart';

import '../models/demo_movie_model.dart';
import 'mbx_apis.dart';

class DemoMovieListVM {
  var loading = false;
  List<DemoMovieModel> list = [];
  List<DemoMovieModel> filtered = [];

  clear() {
    list = [];
  }

  Future<ApiXResponse> nextPage() {
    loading = true;
    return MbxApi.post(
            endpoint: '/movies',
            params: {},
            headers: {},
            contractFile: 'lib/contracts/DemoMovieListContract.json',
            contract: true)
        .then((resp) async {
      loading = false;
      if (resp.status == 200) {
        for (var item in resp.jason['data'].jasonListValue) {
          var movie = DemoMovieModel.fromJason(item);
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
