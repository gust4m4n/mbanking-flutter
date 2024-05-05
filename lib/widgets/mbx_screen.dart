import 'package:mbankingflutter/utils/all_utils.dart';

import 'all_widgets.dart';

class MbxScreen extends StatelessWidget {
  final String title;
  final GestureTapCallback? backAction;
  final Widget? body;
  const MbxScreen({
    Key? key,
    this.title = '',
    this.backAction,
    this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false, // backAction != null,
        onPopInvoked: (didPop) {
          LoggerX.log('onPopInvoked: $didPop');
          if (didPop == false) {
            if (backAction != null) {
              backAction!();
            } else {
              Get.back();
            }
          }
        },
        child: ScreenX(
            lightStatusBar: true,
            headerView: NavigationBarX(
              title: title,
              leftBtn: ImageX(
                faIcon: FontAwesomeIcons.arrowLeft,
                width: 20.0,
                height: 20.0,
                color: ColorX.white,
                fit: BoxFit.contain,
              ),
              leftAction: () {
                if (backAction != null) {
                  backAction!();
                } else {
                  Get.back();
                }
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
            )));
  }
}
