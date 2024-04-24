import '../../widgets/all_widgets.dart';
import 'mbx_bank_picker_controller.dart';
import 'mbx_bank_picker_widget.dart';

// ignore: must_be_immutable
class MbxBankPicker extends GetWidget<MbxBankPickerController> {
  final String title;
  MbxBankPicker({required this.title});

  Future<T?> show<T>() {
    FocusManager.instance.primaryFocus?.unfocus();
    return SheetX.showCustom(title: title, widget: this, percentHeight: 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxBankPickerController>(
        init: MbxBankPickerController(),
        builder: (controller) => ContainerX(
              backgroundColor: ColorX.white,
              child: Container(
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
                                  result:
                                      controller.movieListVM.filtered[index]);
                            },
                            child: MbxBankPickerWidget(
                                controller.movieListVM.filtered[index])));
                  },
                )))
              ])),
            ));
  }
}
