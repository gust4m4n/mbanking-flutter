import 'package:fl_chart/fl_chart.dart';
import '../../widgets/all_widgets.dart';
import 'demo_piechart_controller.dart';

class DemoPieChartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoPieChartController>(
        init: DemoPieChartController(),
        builder: (controller) => ScreenX(
            lightStatusBar: true,
            headerView: NavigationBarX(
              title: 'PieChart',
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
            bodyView: ContainerX(
              padding: const EdgeInsets.all(16.0),
              child: PieChart(
                PieChartData(
                  centerSpaceRadius: 0,
                  sections: controller.pieChartData,
                ),
              ),
            )));
  }
}
