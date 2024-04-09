import '../../widgets/all_widgets.dart';
import 'demo_image_controller.dart';

class DemoImageScreen extends StatelessWidget {
  final String url;
  DemoImageScreen({required this.url});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoImageController>(
      init: DemoImageController(),
      builder: (controller) => ScreenX(
        lightStatusBar: true,
        headerView: NavigationBarX(
          title: 'Image',
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
        bodyView: ImageX(url: url, fit: BoxFit.contain),
      ),
    );
  }
}
