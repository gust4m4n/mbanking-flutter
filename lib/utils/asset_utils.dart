import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class Assets {
  static Future<String> loadString(String path) async {
    return await rootBundle.loadString(path);
  }
}
