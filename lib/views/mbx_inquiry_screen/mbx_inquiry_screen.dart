import '../../widgets/all_widgets.dart';
import 'mbx_inquiry_controller.dart';
import 'mbx_inquiry_widget.dart';

// ignore: must_be_immutable
class MbxInquiryScreen extends GetWidget<MbxInquiryController> {
  Future<T?> show<T>() {
    FocusManager.instance.primaryFocus?.unfocus();
    return SheetX.showCustom(
        title: 'Konfirmasi', widget: this, autoClose: false);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxInquiryController>(
      init: MbxInquiryController(),
      builder: (controller) => ContainerX(
          child: Column(children: [
        ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: widgetMaxHeight(),
            ),
            child: Scrollbar(
                child: SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.inquiryVM.list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return MbxInquiryWidget(
                          dest: controller.inquiryVM.list[index],
                          onDeleteClicked: () {},
                        );
                      },
                    )))),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                  child: ButtonX(
                backgroundColor: ColorX.theme,
                title: 'Transfer',
                onClicked: () {
                  controller.btnNextClicked();
                },
              )),
              ContainerX(width: 8.0),
              Expanded(
                  child: ButtonX(
                backgroundColor: ColorX.theme.withOpacity(0.2),
                highlightColor: ColorX.theme.withOpacity(0.3),
                title: 'Batal',
                titleColor: ColorX.black,
                onClicked: () {
                  controller.btnCloseClicked();
                },
              ))
            ],
          ),
        ),
      ])),
    );
  }

  static double widgetMaxHeight() {
    return MediaQuery.of(Get.context!).size.height -
        (MediaQuery.of(Get.context!).padding.top +
            16.0 +
            16.0 +
            40.0 +
            16.0 +
            // widget height here
            16.0 +
            48.0 +
            16.0 +
            16.0 +
            MediaQuery.of(Get.context!).padding.bottom);
  }
}
