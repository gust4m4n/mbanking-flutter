import 'package:mbankingflutter/views/mbx_transfer_p2p_page/mbx_transfer_p2p_page.dart';

import '../../widgets/all_widgets.dart';
import 'mbx_transfer_controller.dart';

class MbxTransferScreen extends StatelessWidget {
  MbxTransferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxTransferController>(
        init: MbxTransferController(),
        builder: (controller) => ScreenX(
              lightStatusBar: true,
              headerView: NavigationBarX(
                title: 'Transfer',
                leftBtn: ImageX(
                  faIcon: FontAwesomeIcons.arrowLeft,
                  width: 20.0,
                  height: 20.0,
                  color: ColorX.white,
                  fit: BoxFit.contain,
                ),
                leftAction: () {
                  controller.btnBackClicked();
                },
              ),
              bottomPadding: false,
              bodyView: Column(
                children: [
                  TopContainerX(),
                  Expanded(
                      child: ContainerX(
                          backgroundColor: ColorX.white,
                          child: Column(
                            children: [
                              TabBar(
                                controller: controller.tabController,
                                indicatorSize: TabBarIndicatorSize.tab,
                                indicatorWeight: 2.0,
                                indicatorColor: ColorX.theme,
                                unselectedLabelStyle: TextStyle(
                                  color: ColorX.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Roboto',
                                ),
                                labelStyle: TextStyle(
                                  color: ColorX.theme,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Roboto',
                                ),
                                tabs: const [
                                  Tab(
                                    text: 'Antar Rekening',
                                  ),
                                  Tab(text: 'Antar Bank'),
                                ],
                              ),
                              Expanded(
                                child: TabBarView(
                                  controller: controller.tabController,
                                  children: [
                                    MbxTransferP2PPage(),
                                    Center(
                                      child: const TextX(
                                        'Page 2',
                                        color: ColorX.black,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w700,
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ))),
                ],
              ),
            ));
  }
}
