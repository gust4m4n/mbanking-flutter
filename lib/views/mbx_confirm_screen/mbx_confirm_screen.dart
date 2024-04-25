import '../../widgets/all_widgets.dart';
import 'mbx_confirm_controller.dart';
import 'mbx_confirm_widget.dart';

// ignore: must_be_immutable
class MbxConfirmScreen extends GetWidget<MbxConfirmController> {
  Future<T?> show<T>() {
    FocusManager.instance.primaryFocus?.unfocus();
    return SheetX.showCustom(
        title: 'Konfirmasi', widget: this, percentHeight: 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxConfirmController>(
      init: MbxConfirmController(),
      builder: (controller) => ContainerX(
          backgroundColor: ColorX.white,
          child: Column(children: [
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
                                  child: MbxConfirmWidget(
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
