import '../utils/all_utils.dart';
import 'mbx_label_value_model.dart';

class MbxInquiryModel {
  String description = '';
  List<MbxLabelValueModel> details = [];
  String transaction_id = '';

  MbxInquiryModel();

  MbxInquiryModel.fromJason(Jason jason) {
    description = jason['description'].stringValue;
    for (final item in jason['details'].jasonListValue) {
      final detail = MbxLabelValueModel(item);
      details.add(detail);
    }
    transaction_id = jason['transaction_id'].stringValue;
  }
}
