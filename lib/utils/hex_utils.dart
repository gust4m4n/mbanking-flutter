import 'dart:typed_data';
import '../utils/utf8_utils.dart';
import 'package:hex/hex.dart';
import 'logger_x.dart';

class HexUtils {
  static String encode(Uint8List data) {
    return HEX.encode(data);
  }

  static Uint8List decode(String data) {
    return Uint8List.fromList(HEX.decode(data));
  }

  static demo() {
    const plain = 'Hello world!';
    final encoded = HexUtils.encode(Utf8Utils.encode(plain));
    final decoded = HexUtils.decode(encoded);
    LoggerX.log('[HEX] plain: $plain');
    LoggerX.log('[HEX] encoded: $encoded');
    LoggerX.log('[HEX] decord: ${Utf8Utils.decode(decoded)}');
  }
}
