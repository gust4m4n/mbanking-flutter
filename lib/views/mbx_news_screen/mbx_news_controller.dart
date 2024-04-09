import 'package:mbankingflutter/models/mbx_news_model.dart';
import '../../viewmodels/mbx_news_detail_vm.dart';
import '../../widgets/all_widgets.dart';

class MbxNewsController extends GetxController {
  final MbxNewsModel news;
  final newsDetailVM = MbxNewsDetailVM();
  final webController = WebViewController();

  MbxNewsController(this.news);

  @override
  void onReady() {
    super.onReady();
    reload();
    newsDetailVM.request().then((resp) {
      news.content = newsDetailVM.news.content;
      reload();
    });
  }

  btnBackClicked() {
    Get.back();
  }

  reload() {
    update();
    buildHtmlAndFonts('''
          <span style="font-family: 'Roboto'; font-weight: bold; font-size: 24pt; color: #343a40">${news.title}</span>
          <br><br>
          <span style="font-family: 'Roboto'; font-weight: normal; font-size: 15pt; color: #343a40">${news.content}</span>
        ''').then((value) {
      webController.loadHtmlString(value);
    });
  }

  static Future<String> buildHtmlAndFonts(String html) async {
    if (html.isNotEmpty) {
      if (kIsWeb) {
        return html;
      } else {
        String htmlPage = '''<html>
              <head><meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no'>
              <style>
              ${await addFont(fontFamily: 'Roboto', fontPath: 'lib/fonts/Roboto-Regular.ttf', fontMime: 'font/ttf')}
              </style>              
              </head>
              <body style='margin:12pt;padding:0pt;'>
              ${html}
              </body></html>''';
        return htmlPage;
      }
    } else {
      return '';
    }
  }

  static Future<String> addFont(
      {required String fontFamily,
      required String fontPath,
      required String fontMime}) async {
    final fontData = await rootBundle.load(fontPath);
    final fontUri = getFontUri(fontData, fontMime).toString();
    final fontCss = '''
    @font-face {
      font-family: $fontFamily; 
      src: url($fontUri); 
    }
    ''';
    return fontCss;
  }

  static String getFontUri(ByteData data, String mime) {
    final buffer = data.buffer;
    return Uri.dataFromBytes(
            buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
            mimeType: mime)
        .toString();
  }
}
