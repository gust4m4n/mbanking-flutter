import 'dart:developer' as dev;
import 'package:flutter/foundation.dart';

class LoggerX {
  static log(String text) {
    if (kDebugMode) {
      var lines = '';
      final RegExp pattern =
          RegExp('.{1,800}'); // 800 is the size of each chunk
      pattern.allMatches(text).forEach((RegExpMatch match) {
        var line = match.group(0);
        if (line != null) {
          if (lines.isEmpty) {
            lines = line;
          } else {
            lines = '$lines\n$line';
          }
        }
      });
      dev.log(lines);
    }
  }

  static logSeparated(String text) {
    LoggerX.log('\n------\n$text\n------\n');
  }
}
