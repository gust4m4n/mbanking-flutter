import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';

class DemoLineChartController extends GetxController {
  List<FlSpot> chartData = [
    FlSpot(1, 10),
    FlSpot(2, 12),
    FlSpot(3, 28),
    FlSpot(4, 50),
    FlSpot(5, 30),
    FlSpot(6, 35),
    FlSpot(7, 40),
    FlSpot(8, 25),
    FlSpot(9, 45),
  ];

  @override
  void onReady() {
    super.onReady();
  }

  btnBackClicked() {
    Get.back();
  }
}
