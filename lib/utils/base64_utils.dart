import 'dart:convert';
import 'dart:typed_data';
import '../utils/utf8_utils.dart';
import 'logger_x.dart';

class Base64Utils {
  static String encode(Uint8List data) {
    if (data.isNotEmpty) {
      return base64.encode(data);
    } else {
      return '';
    }
  }

  static Uint8List decode(String data) {
    if (data.isNotEmpty) {
      return base64.decode(data);
    } else {
      return Uint8List(0);
    }
  }

  static demo() {
    const plain = 'Hello world!';
    var encoded = Base64Utils.encode(Utf8Utils.encode(plain));
    var decoded = Base64Utils.decode(encoded);

    LoggerX.log('[BASE64] plain: $plain');
    LoggerX.log('[BASE64] encoded: $encoded');
    LoggerX.log('[BASE64] decord: ${Utf8Utils.decode(decoded)}');
  }
}
