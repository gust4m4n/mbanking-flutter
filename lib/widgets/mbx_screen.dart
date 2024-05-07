import 'all_widgets.dart';

class MbxScreen extends StatelessWidget {
  final String title;
  final GestureTapCallback? backAction;
  final Widget? body;
  final Widget? curvedBody;
  final Widget? scrollingBody;
  final Widget? scrollingFooter;
  const MbxScreen({
    Key? key,
    this.title = '',
    this.backAction,
    this.body,
    this.curvedBody,
    this.scrollingBody,
    this.scrollingFooter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
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
            bodyView: curvedBody != null
                ? Column(
                    children: [
                      TopContainerX(),
                      Expanded(
                          child: ContainerX(
                        backgroundColor: ColorX.white,
                        child: curvedBody,
                      )),
                    ],
                  )
                : scrollingBody != null
                    ? ContainerX(
                        child: SingleChildScrollView(
                            physics: ClampingScrollPhysics(),
                            child: Padding(
                                padding: EdgeInsets.only(
                                    left: 16.0,
                                    top: 16.0,
                                    right: 16.0,
                                    bottom: 16.0 +
                                        MediaQuery.of(Get.context!)
                                            .padding
                                            .bottom),
                                child: ContainerX(
                                    backgroundColor: ColorX.white,
                                    cornerRadius: 16.0,
                                    borderWidth: 0.5,
                                    borderColor: ColorX.gray,
                                    padding: EdgeInsets.all(16.0),
                                    child: scrollingBody))))
                    : body != null
                        ? Expanded(child: ContainerX(child: body!))
                        : null));
  }
}
