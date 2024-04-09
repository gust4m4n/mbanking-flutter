import 'dart:async';
import 'mbx_apis.dart';

class MbxLogoutVM {
  static Future<MbxApiResponse> request() {
    return MbxApi.post(
            endpoint: '/logout',
            params: {},
            headers: {},
            contractFile: 'lib/contracts/MbxLogoutContract.json',
            contract: true)
        .then((resp) async {
      return resp;
    });
  }
}
