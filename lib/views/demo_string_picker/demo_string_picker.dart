import '../../widgets/all_widgets.dart';
import 'demo_string_picker_widget.dart';
import 'demo_string_picker_controller.dart';

// ignore: must_be_immutable
class DemoStringPicker extends GetWidget<DemoStringPickerController> {
  final String title;
  final List<String> list;
  DemoStringPicker({required this.title, required this.list});

  Future<T?> show<T>() {
    FocusManager.instance.primaryFocus?.unfocus();
    return SheetX.showWithGrip(
        backgroundColor: ColorX.white, cornerRadius: 32.0, widget: this);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoStringPickerController>(
      init: DemoStringPickerController(),
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
          ContainerX(height: 24.0),
          ListView.separated(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: ContainerX(
                  height: 1.0,
                  width: double.infinity,
                  backgroundColor: ColorX.lightGray,
                )),
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return Material(
                  color: ColorX.transparent,
                  child: InkWell(
                      highlightColor: ColorX.highlight,
                      onTap: () {
                        Get.back(result: list[index]);
                      },
                      child: DemoStringPickerWidget(list[index])));
            },
          ),
          ContainerX(height: 24.0),
        ]),
      ),
    );
  }
}
