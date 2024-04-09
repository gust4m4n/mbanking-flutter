import '../utils/all_utils.dart';

class MbxAccountModel {
  String account = '';
  int balance = 0;
  int id = 0;
  String name = '';
  bool visible = false;

  MbxAccountModel();

  MbxAccountModel.fromJason(Jason jason) {
    account = jason['account'].stringValue;
    balance = jason['balance'].intValue;
    id = jason['id'].intValue;
    name = jason['name'].stringValue;
  }

  Map<String, dynamic> encode() {
    Map<String, dynamic> map = {};
    map['account'] = account;
    map['balance'] = balance;
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}
