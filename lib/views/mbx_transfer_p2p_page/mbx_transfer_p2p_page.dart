import 'package:mbankingflutter/models/mbx_receipt_model.dart';

import '../../widgets/all_widgets.dart';
import '../mbx_receipt_screen/mbx_receipt_screen.dart';
import 'mbx_transfer_p2p_controller.dart';
import 'mbx_transfer_p2p_dest_cell.dart';

class MbxTransferP2PPage extends StatelessWidget {
  MbxTransferP2PPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxTransferP2PController>(
        init: MbxTransferP2PController(),
        builder: (controller) => Column(children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 12.0, top: 8.0, right: 12.0, bottom: 8.0),
                child: TextFieldX(
                  hint: 'Pencarian...',
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  readOnly: false,
                  //controller: controller.txtSearch,
                  onChanged: (value) {
                    //controller.txtSearchChanged(value);
                  },
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      left: 12.0, top: 0.0, right: 12.0, bottom: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ButtonX(
                            title: 'Tujuan Baru',
                            titleColor: ColorX.black,
                            fontSize: 13.0,
                            backgroundColor: ColorX.white,
                            height: 34.0,
                            borderWidth: 1.0,
                            borderColor: ColorX.lightGray,
                            onClicked: () {
                              //controller.btnCameraClicked();
                            }),
                      ),
                      ContainerX(width: 8.0),
                      Expanded(
                        child: ButtonX(
                            title: 'Hapus',
                            titleColor: ColorX.black,
                            fontSize: 13.0,
                            backgroundColor: ColorX.white,
                            height: 34.0,
                            borderWidth: 1.0,
                            borderColor: ColorX.lightGray,
                            onClicked: () {
                              //controller.btnCameraClicked();
                            }),
                      ),
                    ],
                  )),
              Expanded(
                  child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollInfo) {
                  if (controller.destListVM.loading == false &&
                      scrollInfo.metrics.pixels ==
                          scrollInfo.metrics.maxScrollExtent) {
                    controller.nextPage();
                  }
                  return true;
                },
                child: Scrollbar(
                    controller: controller.scrollController,
                    child: ListView.separated(
                        controller: controller.scrollController,
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(Get.context!).padding.bottom +
                                100.0),
                        physics: ClampingScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: ContainerX(
                                height: 0.5,
                                width: double.infinity,
                                backgroundColor: ColorX.lightGray,
                              ));
                        },
                        itemCount: controller.destListVM.list.length,
                        itemBuilder: (context, index) {
                          if (index == controller.destListVM.list.length - 1) {
                            controller.nextPage();
                          }
                          final dest = controller.destListVM.list[index];
                          return InkWellX(
                              highlightColor: ColorX.theme.withOpacity(0.1),
                              onClicked: () {
                                Get.to(MbxReceiptScreen(
                                    receipt: MbxReceiptModel(),
                                    backToHome: false));
                              },
                              child: MbxTransferP2PDestCell(dest));
                        })),
              )),
            ]));
  }
}
