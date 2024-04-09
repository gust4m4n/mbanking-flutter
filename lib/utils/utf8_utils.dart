import 'dart:convert';
import 'dart:typed_data';

class Utf8Utils {
  static Uint8List encode(String data) {
    return Uint8List.fromList(utf8.encode(data));
  }

  static String decode(Uint8List data) {
    return utf8.decode(data);
  }
}
