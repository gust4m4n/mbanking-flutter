import 'package:fl_chart/fl_chart.dart';
import '../../widgets/all_widgets.dart';
import '../../utils/all_utils.dart';
import 'demo_linechart_controller.dart';

class DemoLineChartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoLineChartController>(
      init: DemoLineChartController(),
      builder: (controller) => ScreenX(
          lightStatusBar: true,
          headerView: NavigationBarX(
            title: 'LineChart',
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
          bodyView: Container(
            padding: const EdgeInsets.all(16.0),
            child: LineChart(
              LineChartData(
                  gridData: FlGridData(
                      drawHorizontalLine: false, drawVerticalLine: false),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: controller.chartData,
                      color: ColorX.green,
                      isCurved: false,
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: FlDotData(
                        show: false,
                      ),
                      belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              ColorX.green.lighten(0.28),
                              Colors.white,
                            ],
                          )),
                    ),
                  ]),
            ),
          )),
    );
  }
}
