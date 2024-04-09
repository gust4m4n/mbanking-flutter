import 'dart:typed_data';
import '../utils/logger_x.dart';
import 'package:crypto/crypto.dart';
import 'hex_utils.dart';
import 'utf8_utils.dart';

// https://www.md5.cz/

class Md5Utils {
  static Uint8List convert(Uint8List data) {
    return Uint8List.fromList(md5.convert(data).bytes);
  }

  static demo() {
    const plain = 'Hello world!';
    final digest = Md5Utils.convert(Utf8Utils.encode(plain));
    LoggerX.log('[MD5] plain: $plain\ndigest: ${HexUtils.encode(digest)}');
  }
}
