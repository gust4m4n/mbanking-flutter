import '../../widgets/all_widgets.dart';
import 'mbx_confirm_controller.dart';
import 'mbx_confirm_widget.dart';

// ignore: must_be_immutable
class MbxConfirmScreen extends GetWidget<MbxConfirmController> {
  Future<T?> show<T>() {
    FocusManager.instance.primaryFocus?.unfocus();
    return SheetX.showCustom(
        title: 'Konfirmasi', widget: this, autoClose: false);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxConfirmController>(
      init: MbxConfirmController(),
      builder: (controller) => ContainerX(
          child: Column(children: [
        ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(Get.context!).size.height * 0.7,
            ),
            child: Scrollbar(
                child: SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.destListVM.list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return MbxConfirmWidget(
                          dest: controller.destListVM.list[index],
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
}