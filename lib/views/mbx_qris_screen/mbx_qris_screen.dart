import 'package:mobile_scanner/mobile_scanner.dart';

import '../../viewmodels/mbx_device_info_vm.dart';
import '../../widgets/all_widgets.dart';
import 'mbx_qris_controller.dart';

class MbxQRISScreen extends StatelessWidget {
  MbxQRISScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxQRISController>(
        init: MbxQRISController(),
        builder: (controller) => MbxScreen(
            navigationBarHidden: true,
            body: Stack(children: [
              if (MbxDeviceInfoVM.simulator == false)
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
                    width: MediaQuery.of(Get.context!).size.width - 32.0,
                    height: MediaQuery.of(Get.context!).size.width - 32.0,
                    borderWidth: 1.0,
                    borderColor: ColorX.white),
              )),
              Positioned(
                left: 16.0,
                right: 16.0,
                bottom: 16.0 + MediaQuery.of(Get.context!).padding.bottom,
                child: ContainerX(
                    backgroundColor: ColorX.white,
                    cornerRadius: 16.0,
                    padding: EdgeInsets.only(
                        left: 16.0, top: 8.0, right: 16.0, bottom: 8.0),
                    width: double.infinity,
                    child: Row(
                      children: [
                        ButtonX(
                          title: '',
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
                        ContainerX(width: 8.0),
                        ButtonX(
                          title: '',
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
                        ContainerX(width: 8.0),
                        ButtonX(
                          title: '',
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
                        ContainerX(width: 8.0),
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
