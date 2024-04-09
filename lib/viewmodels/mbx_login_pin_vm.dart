import 'dart:async';
import 'mbx_apis.dart';
import 'mbx_profile_vm.dart';

class MbxLoginPinVM {
  static Future<MbxApiResponse> request(
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
        MbxProfileVM.profile.token = resp.jason['data']['token'].stringValue;
        MbxProfileVM.save();
      } else {}
      return resp;
    });
  }
}
