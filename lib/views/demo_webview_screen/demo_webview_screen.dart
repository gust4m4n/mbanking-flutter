import '../../widgets/all_widgets.dart';
import 'demo_webview_controller.dart';

class DemoWebViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoWebViewController>(
        init: DemoWebViewController(),
        builder: (controller) => ScreenX(
              lightStatusBar: true,
              loading: controller.loading,
              headerView: NavigationBarX(
                title: 'WebView',
                leftBtn: ImageX(
                  faIcon: FontAwesomeIcons.arrowLeft,
                  width: 20.0,
                  height: 20.0,
                  color: ColorX.white,
                  fit: BoxFit.contain,
                ),
                leftAction: () {
                  controller.btnBackClicked();
                },
              ),
              bottomPadding: false,
              bodyView: WebViewWidget(controller: controller.webController),
            ));
  }
}
