import 'dart:async';
import 'mbx_apis.dart';

class MbxLoginPhoneVM {
  static Future<MbxApiResponse> request({required String phone}) {
    final params = {
      'phone': phone,
    };
    return MbxApi.post(
            endpoint: '/login/phone',
            params: params,
            headers: {},
            contractFile: 'lib/contracts/MbxLoginPhoneContract.json',
            contract: true)
        .then((resp) async {
      return resp;
    });
  }
}
