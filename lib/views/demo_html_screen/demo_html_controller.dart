import '../../widgets/all_widgets.dart';

class DemoHtmlController extends GetxController {
  final webController = WebViewController();

  @override
  void onReady() {
    super.onReady();
    buildHtmlAndFonts('''
          <span style="font-family: 'Roboto'; font-weight: bold; font-size: 24pt; color: #343a40">Lorem Ipsum</span>
          <br><br>
          <span style="font-family: 'Roboto'; font-weight: 600; font-size: 17pt; color: #343a40">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</span>
          <br><br>
          <span style="font-family: 'Roboto'; font-weight: normal; font-size: 15pt; color: #343a40">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in dolor odio. Sed eu eleifend augue. Sed id lorem mollis, vestibulum neque a, laoreet libero. Sed eget justo neque. Vivamus interdum, augue nec scelerisque iaculis, diam ipsum mattis enim, in semper ex dolor in magna. Phasellus quis nibh neque. Maecenas tincidunt facilisis ligula ut commodo. Quisque lobortis ultricies purus, at euismod tortor placerat ultricies. Vestibulum congue et risus quis tempus. Sed arcu sapien, tempus auctor nisi at, porta suscipit dui.<p>Sed hendrerit, elit ac tempus vulputate, sapien tellus rhoncus urna, ut tincidunt dolor lacus at ipsum. Sed quis varius lorem, sed laoreet erat. Fusce condimentum sem et tortor efficitur lobortis. Donec interdum porta urna, in varius lectus aliquam sed. Nulla egestas libero lobortis urna interdum, at ultricies lorem imperdiet. Fusce ullamcorper, nisl vitae iaculis rhoncus, sapien neque volutpat lacus, in scelerisque mi tortor et elit. Donec vestibulum justo elit, non gravida enim malesuada a. Praesent sit amet tempus est, sit amet dictum metus. Mauris pellentesque, nisi vitae porttitor vulputate, nibh neque tempus erat, a facilisis felis nibh et tellus. Morbi a semper neque, at tincidunt ipsum. Pellentesque laoreet nec massa quis rhoncus. Etiam pulvinar, nisi sed aliquam euismod, diam felis venenatis metus, eget pellentesque orci mauris sit amet nisi. Integer finibus bibendum ante non rutrum. Integer dignissim vestibulum ultricies. Vivamus dapibus at metus ut elementum. Sed vitae augue consectetur, fermentum justo semper, tempus tortor.<p>Ut nec euismod tellus. Suspendisse fermentum feugiat lectus, eu eleifend purus euismod quis. Sed tempor tempor lacus, ac porta elit scelerisque nec. Vivamus et ipsum egestas, pellentesque ex et, interdum nisi. Phasellus a imperdiet sem. Nam consequat magna arcu, eu vehicula lectus consectetur nec. Aliquam tempor fermentum magna, at consectetur nunc scelerisque ac. Duis ante dolor, sollicitudin vel nibh vel, rhoncus tempor magna. Donec non nisi quis dui placerat blandit. Donec id velit nibh. Pellentesque elementum dolor accumsan nibh malesuada, et aliquam nunc rhoncus. Praesent quis dui id nulla luctus consequat. Pellentesque sodales luctus libero, non efficitur justo dictum quis. In mollis eu ante vel euismod. Proin et felis sed arcu sagittis ornare fermentum sit amet nunc. Quisque sed ultricies metus.</span>
        ''').then((value) {
      webController.loadHtmlString(value);
    });
  }

  btnBackClicked() {
    Get.back();
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
              <body style='margin:16pt;padding:0pt;'>
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
