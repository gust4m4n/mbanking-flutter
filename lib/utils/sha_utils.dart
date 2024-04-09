import 'dart:typed_data';
import '../utils/logger_x.dart';
import 'package:crypto/crypto.dart';
import 'hex_utils.dart';
import 'utf8_utils.dart';

// https://emn178.github.io/online-tools/sha256.html

class ShaUtils {
  static Uint8List convert(Uint8List data) {
    return Uint8List.fromList(sha256.convert(data).bytes);
  }

  static demo() {
    const plain = 'Hello world!';
    final digest = ShaUtils.convert(Utf8Utils.encode(plain));
    LoggerX.log('[SHA] plain: $plain\ndigest: ${HexUtils.encode(digest)}');
  }
}
