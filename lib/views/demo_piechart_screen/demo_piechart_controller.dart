import 'package:fl_chart/fl_chart.dart';
import '../../widgets/all_widgets.dart';

class DemoPieChartController extends GetxController {
  List<PieChartSectionData> pieChartData = [
    PieChartSectionData(
        value: 10, title: '10%', color: ColorX.teal, radius: 150.0),
    PieChartSectionData(
        value: 30, title: '30%', color: ColorX.green, radius: 150.0),
    PieChartSectionData(
        value: 60, title: '60%', color: ColorX.red, radius: 150.0),
  ];

  @override
  void onReady() {
    super.onReady();
  }

  btnBackClicked() {
    Get.back();
  }
}
