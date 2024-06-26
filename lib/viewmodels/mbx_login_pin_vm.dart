import 'dart:async';

import 'package:mbankingflutter/viewmodels/mbx_preferences_vm+users.dart';

import '../utils/all_utils.dart';
import 'mbx_apis.dart';

class MbxLoginPinVM {
  static Future<ApiXResponse> request(
      {required String phone, required String otp, required String pin}) {
    final params = {
      'phone': phone,
      'otp': otp,
      'pin': pin,
    };
    return MbxApi.post(
            endpoint: '/login/pin',
            params: params,
            headers: {},
            contractFile: 'lib/contracts/MbxLoginPinContract.json',
            contract: true)
        .then((resp) async {
      if (resp.status == 200) {
        MbxUserPreferencesVM.setToken(resp.jason['data']['token'].stringValue);
      } else {}
      return resp;
    });
  }
}
