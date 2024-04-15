import 'dart:async';

import '../utils/all_utils.dart';
import 'mbx_apis.dart';

class MbxChangePinVM {
  static Future<ApiXResponse> request(
      {required String pin, required String newPin}) {
    final params = {'pin': pin, 'new_pin': newPin};
    return MbxApi.post(
            endpoint: '/pin/change',
            params: params,
            headers: {},
            contractFile: 'lib/contracts/MbxChangePinContract.json',
            contract: true)
        .then((resp) async {
      return resp;
    });
  }
}
