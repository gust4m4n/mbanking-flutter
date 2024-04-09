import 'dart:typed_data';
import 'package:encrypt/encrypt.dart' as enc;
import 'hex_utils.dart';
import 'logger_x.dart';
import 'utf8_utils.dart';

// http://ieasynote.com/tools/aes
// https://string-o-matic.com/aes-encrypt

class AesUtils {
  static Uint8List encrypt(Uint8List data, Uint8List key, Uint8List iv) {
    final encData = enc.Encrypted(data);
    final encKey = enc.Key(key);
    final encIV = enc.IV(iv);
    final encrypter = enc.Encrypter(enc.AES(encKey, mode: enc.AESMode.cbc));
    return (encrypter.encryptBytes(encData.bytes, iv: encIV)).bytes;
  }

  static Uint8List decrypt(Uint8List data, Uint8List key, Uint8List iv) {
    final encData = enc.Encrypted(data);
    final encKey = enc.Key(key);
    final encIV = enc.IV(iv);
    final encrypter = enc.Encrypter(enc.AES(encKey, mode: enc.AESMode.cbc));
    return Uint8List.fromList(encrypter.decryptBytes(encData, iv: encIV));
  }

  static demo() {
    const plain = 'Hello world!';
    const key =
        'd3b91f0ebf75cc407114307b0ed67f3cd3b91f0ebf75cc407114307b0ed67f3c';
    const iv = '89e4ea9f678d2e94d9548043f54db492';
    final encrypted = AesUtils.encrypt(
        Utf8Utils.encode(plain), HexUtils.decode(key), HexUtils.decode(iv));
    final decrypted =
        AesUtils.decrypt(encrypted, HexUtils.decode(key), HexUtils.decode(iv));
    LoggerX.log('[AES] plain: $plain\n');
    LoggerX.log('[AES] encrypted: ${HexUtils.encode(encrypted)}\n');
    LoggerX.log('[AES] decrypted: ${Utf8Utils.decode(decrypted)}\n');
  }
}
