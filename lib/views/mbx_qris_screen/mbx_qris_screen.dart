import 'package:mbankingflutter/utils/all_utils.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../widgets/all_widgets.dart';
import 'mbx_qris_controller.dart';

class MbxQRISScreen extends StatelessWidget {
  MbxQRISScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxQRISController>(
        init: MbxQRISController(),
        builder: (controller) => ScreenX(
            lightStatusBar: true,
            bottomPadding: true,
            bodyView: Stack(children: [
              MobileScanner(
                controller: controller.scannerController,
                onDetect: (cap) {
                  final List<Barcode> barcodes = cap.barcodes;
                  for (final barcode in barcodes) {
                    controller.QRDetected(barcode.rawValue!);
                    break;
                  }
                },
              ),
              ContainerX(
                  child: Center(
                child: ContainerX(
                    width: MediaQuery.of(Get.context!).size.width - 48.0,
                    height: MediaQuery.of(Get.context!).size.width - 48.0,
                    borderWidth: 1.0,
                    borderColor: ColorX.white),
              )),
              Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 0.0,
                child: ContainerX(
                    backgroundColor:
                        ColorX.theme.lighten(0.45).withOpacity(0.5),
                    padding: EdgeInsets.only(left: 12.0, right: 12.0),
                    width: double.infinity,
                    child: Row(
                      children: [
                        ButtonX(
                          borderWidth: 2.0,
                          borderColor: ColorX.theme.lighten(0.45),
                          backgroundColor: ColorX.theme,
                          width: 40.0,
                          height: 40.0,
                          cornerRadius: 20.0,
                          faIcon: FontAwesomeIcons.arrowLeft,
                          faWidth: 18.0,
                          faHeight: 18.0,
                          faColor: ColorX.white,
                          onClicked: () {
                            controller.btnBackClicked();
                          },
                        ),
                        SizedBox(width: 8.0),
                        ButtonX(
                          borderWidth: 2.0,
                          borderColor: ColorX.theme.lighten(0.45),
                          backgroundColor: ColorX.theme,
                          width: 40.0,
                          height: 40.0,
                          cornerRadius: 20.0,
                          faIcon: FontAwesomeIcons.fileImage,
                          faWidth: 18.0,
                          faHeight: 18.0,
                          faColor: ColorX.white,
                          onClicked: () {
                            controller.btnImageClicked();
                          },
                        ),
                        SizedBox(width: 8.0),
                        ButtonX(
                          borderWidth: 2.0,
                          borderColor: ColorX.theme.lighten(0.45),
                          backgroundColor: controller.flashlight
                              ? ColorX.white
                              : ColorX.theme,
                          width: 40.0,
                          height: 40.0,
                          cornerRadius: 20.0,
                          faIcon: FontAwesomeIcons.bolt,
                          faWidth: 18.0,
                          faHeight: 18.0,
                          faColor: controller.flashlight
                              ? ColorX.theme
                              : ColorX.white,
                          onClicked: () {
                            controller.btnFlashlightClicked();
                          },
                        ),
                        Expanded(
                          child: ImageX(
                            url: 'lib/images/mbx_qris.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    )),
              ),
            ])));
  }
}
