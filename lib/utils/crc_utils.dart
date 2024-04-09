import 'dart:typed_data';
import 'package:crclib/catalog.dart';
import 'logger_x.dart';
import 'utf8_utils.dart';

class CrcUtils {
  static String convert(Uint8List data) {
    final value = Crc32Xz().convert(data);
    return value.toRadixString(16);
  }

  static demo() {
    const plain = 'Hello world!';
    final value = CrcUtils.convert(Utf8Utils.encode(plain));
    LoggerX.log('[CRC] plain: $plain\nCRC: 0x$value');
  }
}
