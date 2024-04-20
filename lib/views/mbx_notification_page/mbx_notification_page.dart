import 'package:mbankingflutter/models/mbx_receipt_model.dart';

import '../../widgets/all_widgets.dart';
import 'mbx_notification_cell.dart';
import 'mbx_notification_controller.dart';

class MbxNotificationPage extends StatelessWidget {
  MbxNotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxNotificationController>(
        init: MbxNotificationController(),
        builder: (controller) => ScreenX(
            lightStatusBar: true,
            headerView: NavigationBarX(
              title: 'Notifikasi',
            ),
            bottomPadding: false,
            bodyView: ContainerX(
                backgroundColor: ColorX.theme,
                child: Column(children: [
                  //TopContainerX(),
                  Expanded(
                      child: NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollInfo) {
                      if (controller.notificationListVM.loading == false &&
                          scrollInfo.metrics.pixels ==
                              scrollInfo.metrics.maxScrollExtent) {
                        controller.nextPage();
                      }
                      return true;
                    },
                    child: Scrollbar(
                        controller: controller.scrollController,
                        child: ListView.builder(
                            controller: controller.scrollController,
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(Get.context!).padding.bottom +
                                        100.0),
                            physics: ClampingScrollPhysics(),
                            itemCount:
                                controller.notificationListVM.list.length,
                            itemBuilder: (context, index) {
                              if (index ==
                                  controller.notificationListVM.list.length -
                                      1) {
                                controller.nextPage();
                              }
                              final history =
                                  controller.notificationListVM.list[index];
                              return InkWellX(
                                  highlightColor: ColorX.theme.withOpacity(0.1),
                                  onClicked: () {
                                    Get.toNamed('/receipt', arguments: {
                                      'receipt': MbxReceiptModel(),
                                      'backToHome': false
                                    });
                                  },
                                  child: MbxNotificationCell(history));
                            })),
                  )),
                ]))));
  }
}
