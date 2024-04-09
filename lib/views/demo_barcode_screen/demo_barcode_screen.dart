import 'package:barcode_widget/barcode_widget.dart';
import '../../widgets/all_widgets.dart';
import 'demo_barcode_controller.dart';

class DemoBarcodeScreen extends StatelessWidget {
  DemoBarcodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoBarcodeController>(
        init: DemoBarcodeController(),
        builder: (controller) => ScreenX(
              lightStatusBar: true,
              headerView: NavigationBarX(
                title: 'Barcode',
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
              bottomPadding: true,
              bodyView: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BarcodeWidget(
                      barcode: Barcode.gs128(), // Barcode type and settings
                      data: controller.code,
                      width: 250,
                      height: 100,
                    ),
                  ],
                ),
              ),
            ));
  }
}
