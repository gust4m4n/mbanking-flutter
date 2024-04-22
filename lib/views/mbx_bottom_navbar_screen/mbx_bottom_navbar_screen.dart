import 'package:mbankingflutter/views/mbx_bottom_navbar_screen/mbx_bottom_navbar_button.dart';
import 'package:mbankingflutter/views/mbx_notification_page/mbx_notification_page.dart';

import '../../widgets/all_widgets.dart';
import '../mbx_history_page/mbx_history_page.dart';
import '../mbx_home_page/mbx_home_page.dart';
import '../mbx_profile_page/mbx_profile_page.dart';
import 'mbx_bottom_navbar_controller.dart';

// ignore: must_be_immutable
class MbxBottomNavBarScreen extends StatelessWidget {
  final int tabBarIndex;
  MbxBottomNavBarScreen({this.tabBarIndex = 0});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxBottomNavBarController>(
        init: MbxBottomNavBarController(tabBarIndex: tabBarIndex),
        builder: (controller) => ScreenX(
              bodyView: IndexedStack(
                index: controller.tabBarIndex,
                children: <Widget>[
                  MbxHomePage(),
                  MbxHistoryPage(),
                  ContainerX(backgroundColor: ColorX.white),
                  MbxNotificationPage(),
                  MbxProfilePage(),
                ],
              ),
              floatingActionButton: Stack(children: [
                ContainerX(
                    width: 70.0,
                    height: 70.0,
                    cornerRadius: 35.0,
                    backgroundColor: ColorX.white),
                ContainerX(
                    width: 70.0,
                    height: 70.0,
                    cornerRadius: 35.0,
                    backgroundColor: ColorX.theme.withOpacity(0.1),
                    child: Center(
                        child: ButtonX(
                      backgroundColor: ColorX.theme,
                      width: 60.0,
                      height: 60.0,
                      cornerRadius: 30.0,
                      faIcon: FontAwesomeIcons.qrcode,
                      faColor: ColorX.white,
                      onClicked: () {
                        controller.btnQRISClicked();
                      },
                    ))),
              ]),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: Stack(
                children: [
                  ContainerX(
                      height: 60.0 + MediaQuery.of(Get.context!).padding.bottom,
                      backgroundColor: ColorX.white),
                  ContainerX(
                      height: 60.0 + MediaQuery.of(Get.context!).padding.bottom,
                      backgroundColor: ColorX.theme.withOpacity(0.1)),
                  BottomAppBar(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    height: 60.0,
                    elevation: 0.0,
                    color: ColorX.transparent,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        MbxButtonNavBarButton(
                            title: 'Beranda',
                            faIcon: FontAwesomeIcons.house,
                            selected: controller.tabBarIndex == 0,
                            onClicked: () {
                              controller.btnHomeClicked();
                            }),
                        MbxButtonNavBarButton(
                            title: 'Riwayat',
                            faIcon: FontAwesomeIcons.clockRotateLeft,
                            selected: controller.tabBarIndex == 1,
                            onClicked: () {
                              controller.btnHistoryClicked();
                            }),
                        ContainerX(
                          width: MbxButtonNavBarButton.buttonWidth,
                        ),
                        MbxButtonNavBarButton(
                            title: 'Notifikasi',
                            faIcon: FontAwesomeIcons.bell,
                            selected: controller.tabBarIndex == 3,
                            onClicked: () {
                              controller.btnNotificationsClicked();
                            }),
                        MbxButtonNavBarButton(
                            title: 'Akun',
                            faIcon: FontAwesomeIcons.user,
                            selected: controller.tabBarIndex == 4,
                            onClicked: () {
                              controller.btnAccountClicked();
                            }),
                      ],
                    ),
                  )
                ],
              ),
            ));
  }
}
