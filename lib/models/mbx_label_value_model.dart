import '../utils/all_utils.dart';

class MbxLabelValueModel {
  String label = '';
  String value = '';

  MbxLabelValueModel(Jason jason) {
    label = jason['label'].stringValue;
    value = jason['value'].stringValue;
  }
}
