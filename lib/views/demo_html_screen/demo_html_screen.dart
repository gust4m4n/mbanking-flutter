import '../../widgets/all_widgets.dart';
import 'demo_html_controller.dart';

class DemoHtmlScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoHtmlController>(
        init: DemoHtmlController(),
        builder: (controller) => ScreenX(
              lightStatusBar: true,
              headerView: NavigationBarX(
                title: 'HTML',
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
