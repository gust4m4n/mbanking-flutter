import 'dart:convert';
import 'dart:typed_data';
import 'hex_utils.dart';
import 'logger_x.dart';
import 'utf8_utils.dart';

// https://md5decrypt.net/en/Xor/#results

class XorUtils {
  static Uint8List encrypt(Uint8List plain, Uint8List key) {
    final keyLength = key.length;
    final charByte1 = plain;
    final charByte2 = key;
    List<int> returnValue = [];
    for (var i = 0; i < plain.length; i++) {
      final index2 = i % keyLength;
      final xorChar = charByte1[i] ^ charByte2[index2];
      returnValue.add(xorChar);
    }
    return Uint8List.fromList(returnValue);
  }

  static String decrypt(Uint8List plain, Uint8List key) {
    final keyLength = key.length;
    final charByte1 = plain;
    final charByte2 = key;
    List<int> returnValue = [];
    for (var i = 0; i < plain.length; i++) {
      final index2 = i % keyLength;
      final xorChar = charByte1[i] ^ charByte2[index2];
      returnValue.add(xorChar);
    }
    return utf8.decode(returnValue);
  }

  static demo() {
    const plain = 'Hello world!';
    const key =
        '9b2611f319e2c88f1dce0a7a612bcf1f5b037bc66b9e8144725da7faf16cc3f2';
    final encrypted =
        XorUtils.encrypt(Utf8Utils.encode(plain), Utf8Utils.encode(key));
    final decrypted = XorUtils.decrypt(encrypted, Utf8Utils.encode(key));
    LoggerX.log('[XOR] plain: $plain');
    LoggerX.log('[XOR] encrypted: ${HexUtils.encode(encrypted)}');
    LoggerX.log('[XOR] decrypted: $decrypted');
  }
}
