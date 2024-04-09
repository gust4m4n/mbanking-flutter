import '../../widgets/all_widgets.dart';
import 'demo_tabbar_controller.dart';

class DemoTabBarScreen extends StatelessWidget {
  DemoTabBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoTabBarController>(
        init: DemoTabBarController(),
        builder: (controller) => ScreenX(
              headerView: NavigationBarX(
                title: 'TabBar',
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
              lightStatusBar: true,
              bottomPadding: true,
              bodyView: Column(
                children: [
                  TabBar(
                    controller: controller.tabController,
                    indicatorColor: ColorX.blue,
                    indicatorWeight: 2.0,
                    unselectedLabelStyle: TextStyle(
                      color: ColorX.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto',
                    ),
                    labelStyle: TextStyle(
                      color: ColorX.blue,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto',
                    ),
                    tabs: const [
                      Tab(
                        text: 'Tab 1',
                      ),
                      Tab(text: 'Tab 2'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: controller.tabController,
                      children: const [
                        Center(
                          child: const TextX(
                            'Page 1',
                            color: ColorX.black,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w700,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                          ),
                        ),
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
              ),
            ));
  }
}
