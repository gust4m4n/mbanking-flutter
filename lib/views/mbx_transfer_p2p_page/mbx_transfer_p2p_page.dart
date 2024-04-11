import 'package:mbankingflutter/models/mbx_receipt_model.dart';

import '../../widgets/all_widgets.dart';
import '../mbx_receipt_screen/mbx_receipt_screen.dart';
import 'mbx_transfer_p2p_cell.dart';
import 'mbx_transfer_p2p_controller.dart';

class MbxTransferP2PPage extends StatelessWidget {
  MbxTransferP2PPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxTransferP2PController>(
        init: MbxTransferP2PController(),
        builder: (controller) => Column(children: [
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
                              child: MbxTransferP2PCell(dest));
                        })),
              )),
            ]));
  }
}
