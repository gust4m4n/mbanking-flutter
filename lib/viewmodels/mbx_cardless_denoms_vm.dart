import '../models/mbx_cardless_step_model.dart';
import '../utils/all_utils.dart';
import 'mbx_apis.dart';

class MbxCardlessDenomsVM {
  List<MbxCardlessStepModel> steps = [];

  Future<ApiXResponse> request(
      {required String transaction_id,
      required String pin,
      required bool biometric}) {
    return MbxApi.get(
            endpoint: '/cardless/denoms',
            params: {},
            headers: {},
            contractFile: 'lib/contracts/MbxCardlessDenomsContract.json',
            contract: true)
        .then((resp) {
      if (resp.status == 200) {
        steps = [];
        for (var item in resp.jason['data'].jasonListValue) {
          steps.add(MbxCardlessStepModel.fromJason(item));
        }
      }
      return resp;
    });
  }
}
