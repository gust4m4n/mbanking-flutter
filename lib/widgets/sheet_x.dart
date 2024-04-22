import 'all_widgets.dart';

class SheetX {
  static Future<T?> showMessage<T>(
      {Widget? icon,
      required String title,
      required String message,
      bool centered = true,
      required String leftBtnTitle,
      required VoidCallback onLeftBtnClicked,
      String rightBtnTitle = '',
      VoidCallback? onRightBtnClicked,
      bool autoClose = true}) {
    return SheetX.showContent(
        backgroundColor: ColorX.white,
        cornerRadius: 16.0,
        contentMaxHeight: MediaQuery.of(Get.context!).size.height * 0.70,
        contentWidget: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            children: [
              Visibility(
                visible: icon != null,
                child: Column(children: [
                  icon ?? Container(),
                  const SizedBox(height: 12.0),
                ]),
              ),
              const SizedBox(height: 8.0),
              TextX(
                message,
                color: ColorX.black,
                fontSize: 17.0,
                fontWeight: FontWeight.w400,
                textAlign: centered ? TextAlign.center : TextAlign.start,
                maxLines: 2048,
              ),
            ],
          ),
        ),
        footerWidget: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Visibility(
                visible: leftBtnTitle.isNotEmpty,
                child: Expanded(
                  child: ButtonX(
                    title: leftBtnTitle,
                    titleColor: ColorX.white,
                    borderWidth: 1.0,
                    borderColor: ColorX.theme,
                    backgroundColor: ColorX.theme,
                    onClicked: onLeftBtnClicked,
                  ),
                ),
              ),
              Visibility(
                  visible: leftBtnTitle.isNotEmpty && rightBtnTitle.isNotEmpty,
                  child: const SizedBox(width: 8.0)),
              Visibility(
                visible: rightBtnTitle.isNotEmpty,
                child: Expanded(
                  child: ButtonX(
                    title: rightBtnTitle,
                    titleColor: ColorX.black,
                    backgroundColor: ColorX.white,
                    highlightColor: ColorX.theme.withOpacity(0.1),
                    borderWidth: 1.0,
                    borderColor: ColorX.gray,
                    onClicked: onRightBtnClicked ?? () => {},
                  ),
                ),
              )
            ],
          ),
        ),
        autoClose: autoClose,
        title: title);
  }

  static Future<T?> show<T>({required Widget widget, bool autoClose = true}) {
    FocusManager.instance.primaryFocus?.unfocus();
    return Get.bottomSheet(
        isDismissible: autoClose,
        isScrollControlled: true,
        ignoreSafeArea: true,
        elevation: 0.0,
        widget);
  }

  static Future<T?> showWithGrip<T>(
      {required Widget widget, String title = '', bool autoClose = true}) {
    return SheetX.show(
        widget: ContainerX(
            backgroundColor: ColorX.transparent,
            padding: EdgeInsets.only(
                left: 16.0,
                top: 16.0,
                right: 16.0,
                bottom: 16.0 + MediaQuery.of(Get.context!).padding.bottom),
            child: ContainerX(
                backgroundColor: ColorX.white,
                cornerRadius: 16.0,
                child: Wrap(children: [
                  ContainerX(
                      padding: EdgeInsets.all(16.0),
                      child: Wrap(
                        children: [
                          ContainerX(
                            height: 40.0,
                            //backgroundColor: ColorX.yellow,
                            child: Row(
                              children: [
                                InkWellX(
                                  onClicked: () {
                                    Get.back();
                                  },
                                  child: ContainerX(
                                    width: 40.0,
                                    height: double.infinity,
                                    child: Center(
                                        child: ImageX(
                                      backgroundColor:
                                          ColorX.black.withOpacity(0.2),
                                      faIcon: FontAwesomeIcons.xmark,
                                      width: 32.0,
                                      height: 32.0,
                                      cornerRadius: 20.0,
                                      padding: EdgeInsets.all(8.0),
                                    )),
                                  ),
                                ),
                                ContainerX(width: 8.0),
                                Expanded(
                                  child: TextX(
                                    title,
                                    color: ColorX.black,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w600,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                ContainerX(width: 8.0),
                                SizedBox(
                                  width: 40.0,
                                  height: double.infinity,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                  widget
                ]))),
        autoClose: autoClose);
  }

  static Future<T?> showContent<T>(
      {required Color backgroundColor,
      required double cornerRadius,
      required double contentMaxHeight,
      required Widget contentWidget,
      required Widget footerWidget,
      bool autoClose = true,
      String title = ''}) {
    return SheetX.showWithGrip(
        widget: ContainerX(
            backgroundColor: ColorX.white,
            child: Column(children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: contentMaxHeight,
                ),
                child: Scrollbar(
                    child: SingleChildScrollView(
                  child: contentWidget,
                )),
              ),
              footerWidget,
              SizedBox(height: MediaQuery.of(Get.context!).padding.bottom)
            ])),
        title: title,
        autoClose: autoClose);
  }
}
