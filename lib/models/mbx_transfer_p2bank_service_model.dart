import '../utils/all_utils.dart';

class MbxTransferP2BankServiceModel {
  String name = '';
  String code = '';
  int fee = 0;

  MbxTransferP2BankServiceModel();

  MbxTransferP2BankServiceModel.fromJason(Jason jason) {
    name = jason['name'].stringValue;
    code = jason['code'].stringValue;
    fee = jason['fee'].intValue;
  }
}
