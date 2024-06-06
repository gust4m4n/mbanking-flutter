import '../../widgets/all_widgets.dart';
import 'mbx_string_picker_controller.dart';
import 'mbx_string_picker_widget.dart';

// ignore: must_be_immutable
class MbxStringPicker extends GetWidget<MbxStringPickerController> {
  Future<T?> show<T>() {
    FocusManager.instance.primaryFocus?.unfocus();
    return SheetX.showCustom(
        title: 'String Picker', widget: this, percentHeight: 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxStringPickerController>(
      init: MbxStringPickerController(),
      builder: (controller) => ContainerX(
          backgroundColor: ColorX.white,
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 16.0, top: 0.0, right: 16.0, bottom: 12.0),
              child: TextFieldX(
                hint: 'Pencarian...',
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
                child: controller.loading
                    ? Center(
                        child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(ColorX.gray)),
                      )
                    : Scrollbar(
                        child: ListView.separated(
                        padding: EdgeInsets.zero,
                        physics: ClampingScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return Padding(
                              padding: EdgeInsets.only(left: 16.0),
                              child: ContainerX(
                                height: 0.5,
                                width: double.infinity,
                                backgroundColor: ColorX.lightGray,
                              ));
                        },
                        itemCount: controller.destListVM.filtered.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Material(
                              color: ColorX.transparent,
                              child: InkWell(
                                  highlightColor: ColorX.highlight,
                                  onTap: () {
                                    Get.back(
                                        result: controller
                                            .destListVM.filtered[index]);
                                  },
                                  child: MbxStringPickerWidget(
                                    dest: controller.destListVM.filtered[index],
                                    onDeleteClicked: () {
                                      controller.onDeleteClicked(controller
                                          .destListVM.filtered[index]);
                                    },
                                  )));
                        },
                      ))),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: ButtonX(
                backgroundColor: ColorX.theme,
                title: 'Batal',
                onClicked: () {
                  controller.btnCloseClicked();
                },
              ),
            ),
          ])),
    );
  }
}
