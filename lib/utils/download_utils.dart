import 'dart:io';
import '../utils/logger_x.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;

Future<String> downloadFile(String url, String filename, String dirName) async {
  LoggerX.log('[DEMO] Downloading $url');
  final response = await http.get(Uri.parse(url));
  final docDir = await path_provider.getApplicationDocumentsDirectory();
  var dir = Directory('${docDir.path}/');
  if (dirName.isNotEmpty) {
    dir = Directory('${docDir.path}/$dirName/');
  }
  await dir.create(recursive: true);
  var fname = path.basename(url);
  if (filename.isNotEmpty) {
    fname = filename;
  }
  final localPath = path.join(dir.path, fname);
  final imageFile = File(localPath);
  await imageFile.writeAsBytes(response.bodyBytes);
  LoggerX.log('[DEMO] Saved to $localPath');
  return localPath;
}
