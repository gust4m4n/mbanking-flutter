import 'all_widgets.dart';

class MbxScreen extends StatelessWidget {
  final Widget? body;

  const MbxScreen({
    Key? key,
    this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenX(
        lightStatusBar: true,
        headerView: NavigationBarX(
          title: '',
          leftBtn: ImageX(
            faIcon: FontAwesomeIcons.arrowLeft,
            width: 20.0,
            height: 20.0,
            color: ColorX.white,
            fit: BoxFit.contain,
          ),
          leftAction: () {
            Get.back();
          },
        ),
        bottomPadding: false,
        bodyView: Column(
          children: [
            TopContainerX(),
            Expanded(
                child: ContainerX(
              backgroundColor: ColorX.white,
              child: body,
            )),
          ],
        ));
  }
}
