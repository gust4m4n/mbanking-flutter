import 'dart:async';
import '../models/mbx_onboarding_model.dart';
import 'mbx_apis.dart';

class MbxOnboardingListVM {
  var loading = false;
  List<MbxOnboardingModel> list = [];
  List<MbxOnboardingModel> filtered = [];

  clear() {
    list = [];
  }

  Future<MbxApiResponse> nextPage() {
    loading = true;
    return MbxApi.get(
            endpoint: '/movies',
            params: {},
            headers: {},
            contractFile: 'lib/contracts/MbxOnboardingListContract.json',
            contract: true)
        .then((resp) async {
      loading = false;
      if (resp.status == 200) {
        for (var item in resp.jason['data'].jasonListValue) {
          var movie = MbxOnboardingModel.fromJason(item);
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
