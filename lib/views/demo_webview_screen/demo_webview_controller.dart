import '../../widgets/all_widgets.dart';

class DemoWebViewController extends GetxController {
  var loading = false;
  final webController = WebViewController();

  @override
  void onReady() {
    super.onReady();
    webController.setJavaScriptMode(JavaScriptMode.unrestricted);
    webController.setBackgroundColor(ColorX.white);
    webController.setNavigationDelegate(NavigationDelegate(
      onProgress: (int progress) {},
      onPageStarted: (String url) {
        loading = true;
        update();
      },
      onPageFinished: (String url) {
        loading = false;
        update();
      },
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        return NavigationDecision.navigate;
      },
    ));
    webController.loadRequest(Uri.parse('https://flutter.dev'));
    update();
  }

  btnBackClicked() {
    Get.back();
  }
}
