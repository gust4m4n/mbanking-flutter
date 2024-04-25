import '../utils/all_utils.dart';

class MbxConfirmModel {
  String label = '';
  String value = '';

  MbxConfirmModel(Jason jason) {
    label = jason['label'].stringValue;
    value = jason['value'].stringValue;
  }
}
