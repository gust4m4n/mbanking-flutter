import 'all_widgets.dart';

class ScreenX extends StatelessWidget {
  final Key? scaffoldKey;
  final Widget? drawer;
  final Widget? headerView;
  final Widget? bodyView;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? bottomNavigationBar;
  final bool topPadding;
  final bool bottomPadding;
  final bool lightStatusBar;
  final bool loading;

  const ScreenX({
    Key? key,
    this.scaffoldKey,
    this.drawer,
    this.headerView,
    this.bodyView,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomNavigationBar,
    this.topPadding = false,
    this.bottomPadding = false,
    this.lightStatusBar = true,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (lightStatusBar == true) {
      StatusBarX.setLight();
    } else {
      StatusBarX.setDark();
    }
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: StatusBarX.theme,
        child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Scaffold(
                key: scaffoldKey,
                backgroundColor: ColorX.white,
                drawer: drawer,
                extendBody: true,
                floatingActionButton: floatingActionButton,
                floatingActionButtonLocation: floatingActionButtonLocation,
                bottomNavigationBar: bottomNavigationBar,
                body: Column(children: [
                  SizedBox(
                    height: topPadding
                        ? MediaQuery.of(Get.context!).padding.top
                        : 0.0,
                  ),
                  if (headerView != null) headerView!,
                  Expanded(
                      child: ContainerX(
                          height: double.infinity,
                          width: double.infinity,
                          clipBehavior: Clip.none,
                          child: loading
                              ? Center(
                                  child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          ColorX.gray)),
                                )
                              : bodyView ??
                                  ContainerX(
                                      backgroundColor: ColorX.transparent))),
                  SizedBox(
                    height: bottomPadding
                        ? MediaQuery.of(Get.context!).padding.bottom
                        : 0.0,
                  ),
                ]))));
  }
}
