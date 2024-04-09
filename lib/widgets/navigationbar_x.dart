import 'all_widgets.dart';

class NavigationBarX extends StatelessWidget {
  final String? title;
  final Widget? leftBtn;
  final GestureTapCallback? leftAction;
  final Widget? rightBtn;
  final GestureTapCallback? rightAction;
  NavigationBarX(
      {this.title,
      this.leftBtn,
      this.leftAction,
      this.rightBtn,
      this.rightAction});

  @override
  Widget build(BuildContext context) {
    return ContainerX(
        backgroundColor: ColorX.theme,
        height: MediaQuery.of(Get.context!).padding.top + 50.0,
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(Get.context!).padding.top,
          ),
          ContainerX(
              height: 50.0,
              child: Material(
                  color: ColorX.theme,
                  child: Column(children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        leftBtn != null
                            ? InkWellX(
                                //splashFactory: NoSplash.splashFactory,
                                onClicked: () =>
                                    leftAction != null ? leftAction!() : null,
                                child: ContainerX(
                                    width: 60.0,
                                    height: 50.0,
                                    child: Center(child: leftBtn!)),
                              )
                            : const SizedBox(width: 60.0, height: 50.0),
                        Expanded(
                          child: TextX(
                            title ?? '',
                            color: ColorX.white,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w600,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                          ),
                        ),
                        rightBtn != null
                            ? InkWellX(
                                onClicked: () =>
                                    rightAction != null ? rightAction!() : null,
                                child: ContainerX(
                                    width: 60.0,
                                    height: 50.0,
                                    child: Center(child: rightBtn!)),
                              )
                            : const SizedBox(width: 60.0, height: 50.0),
                      ],
                    ),
                  ]))),
        ]));
  }
}
