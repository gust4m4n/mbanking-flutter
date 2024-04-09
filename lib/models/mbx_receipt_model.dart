import '../utils/all_utils.dart';
import 'mbx_receipt_detail_model.dart';

class MbxReceiptModel {
  String amount = '';
  List<MbxReceiptDetailModel> details = [];
  String title = '';
  String transaction_id = '';

  MbxReceiptModel();

  MbxReceiptModel.fromJason(Jason jason) {
    amount = jason['amount'].stringValue;
    for (final item in jason['details'].jasonListValue) {
      final detail = MbxReceiptDetailModel(item);
      details.add(detail);
    }
    title = jason['title'].stringValue;
    transaction_id = jason['transaction_id'].stringValue;
  }
}
