import '../utils/all_utils.dart';

class MbxQRISInquiryModel {
  String acquirer = '';
  String merchant_code = '';
  String merchant_name = '';
  String mpan = '';
  String ref = '';
  String transaction_id = '';

  MbxQRISInquiryModel();

  MbxQRISInquiryModel.fromJason(Jason jason) {
    acquirer = jason['acquirer'].stringValue;
    merchant_code = jason['merchant_code'].stringValue;
    merchant_name = jason['merchant_name'].stringValue;
    mpan = jason['mpan'].stringValue;
    ref = jason['ref'].stringValue;
    transaction_id = jason['transaction_id'].stringValue;
  }
}
