import '../../widgets/all_widgets.dart';
import 'demo_search_picker_controller.dart';
import 'demo_search_picker_widget.dart';

// ignore: must_be_immutable
class DemoSearchPicker extends GetWidget<DemoSearchPickerController> {
  final String title;
  DemoSearchPicker({required this.title});

  Future<T?> show<T>() {
    FocusManager.instance.primaryFocus?.unfocus();
    return SheetX.showWithGrip(
        backgroundColor: ColorX.white,
        cornerRadius: 32.0,
        widget: this);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoSearchPickerController>(
      init: DemoSearchPickerController(),
      builder: (controller) => ContainerX(
        backgroundColor: ColorX.white,
        topLeftRadius: 32.0,
        topRightRadius: 32.0,
        child: Wrap(children: [
          ContainerX(height: 8.0),
          Container(
            margin: EdgeInsets.only(left: 32.0, right: 32.0),
            child: Row(
              children: [
                ButtonX(
                  backgroundColor: ColorX.transparent,
                  faIcon: FontAwesomeIcons.xmark,
                  faWidth: 16.0,
                  faHeight: 16.0,
                  faColor: ColorX.gray,
                  width: 32.0,
                  height: 32.0,
                  cornerRadius: 25.0,
                  borderWidth: 1.0,
                  borderColor: ColorX.gray,
                  onClicked: () {
                    controller.btnCloseClicked();
                  },
                ),
                Expanded(
                  child: TextX(
                    title,
                    color: ColorX.black,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(width: 32.0, height: 32.0),
              ],
            ),
          ),
          Container(height: 24.0),
          Container(
            height: (MediaQuery.of(Get.context!).size.height -
                (MediaQuery.of(Get.context!).padding.top +
                    4.0 + // grip
                    24.0 +
                    16.0 +
                    50.0 + // navbar
                    16.0)),
            child: controller.movieListVM.loading == true
                ? Center(
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(ColorX.gray)),
                  )
                : Container(
                    child: Column(children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 24.0, top: 0.0, right: 24.0, bottom: 12.0),
                      child: TextFieldX(
                        hint: 'Keyword...',
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        readOnly: false,
                        controller: controller.txtSearch,
                        onChanged: (value) {
                          controller.txtSearchChanged(value);
                        },
                      ),
                    ),
                    Expanded(
                        child: Scrollbar(
                            child: ListView.separated(
                      physics: ClampingScrollPhysics(),
                      separatorBuilder: (context, index) => const Divider(
                        color: ColorX.transparent,
                        height: 0.0,
                      ),
                      itemCount: controller.movieListVM.filtered.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Material(
                            color: ColorX.transparent,
                            child: InkWell(
                                highlightColor: ColorX.highlight,
                                onTap: () {
                                  Get.back(
                                      result: controller
                                          .movieListVM.filtered[index]);
                                },
                                child: DemoSearchPickerWidget(
                                    controller.movieListVM.filtered[index])));
                      },
                    )))
                  ])),
          )
        ]),
      ),
    );
  }
}
