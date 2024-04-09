import '../utils/all_utils.dart';

class MbxReceiptDetailModel {
  String label = '';
  String value = '';

  MbxReceiptDetailModel(Jason jason) {
    label = jason['label'].stringValue;
    value = jason['value'].stringValue;
  }
}
