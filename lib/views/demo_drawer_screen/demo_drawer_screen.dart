import '../../widgets/all_widgets.dart';
import 'demo_drawer.dart';
import 'demo_drawer_controller.dart';

class DemoDrawerScreen extends StatelessWidget {
  DemoDrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoDrawerController>(
      init: DemoDrawerController(),
      builder: (controller) => ScreenX(
        scaffoldKey: controller.scaffoldKey,
        drawer: DemoDrawer(),
        lightStatusBar: true,
        headerView: NavigationBarX(
          title: 'Drawer',
          leftBtn: ImageX(
            faIcon: FontAwesomeIcons.bars,
            width: 20.0,
            height: 20.0,
            color: ColorX.white,
            fit: BoxFit.contain,
          ),
          leftAction: () {
            controller.openDrawer();
          },
        ),
        bottomPadding: false,
        bodyView: Center(
          child: const TextX(
            'Swipe to open drawer',
            color: ColorX.black,
            fontSize: 22.0,
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.start,
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
