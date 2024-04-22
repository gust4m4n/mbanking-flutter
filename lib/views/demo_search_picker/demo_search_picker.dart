import '../../widgets/all_widgets.dart';
import 'demo_search_picker_controller.dart';
import 'demo_search_picker_widget.dart';

// ignore: must_be_immutable
class DemoSearchPicker extends GetWidget<DemoSearchPickerController> {
  final String title;
  DemoSearchPicker({required this.title});

  Future<T?> show<T>() {
    FocusManager.instance.primaryFocus?.unfocus();
    return SheetX.showWithGrip(title: 'Demo Search Picker', widget: this);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoSearchPickerController>(
      init: DemoSearchPickerController(),
      builder: (controller) => ContainerX(
        backgroundColor: ColorX.white,
        child: Wrap(children: [
          Container(
            height: (MediaQuery.of(Get.context!).size.height -
                (MediaQuery.of(Get.context!).padding.top +
                    MediaQuery.of(Get.context!).padding.bottom +
                    16.0 +
                    16.0 +
                    40.0 +
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
                          left: 16.0, top: 0.0, right: 16.0, bottom: 12.0),
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
