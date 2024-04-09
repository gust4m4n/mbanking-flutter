import '../../widgets/all_widgets.dart';
import 'demo_receipt_widget.dart';
import 'demo_receipt_controller.dart';

// ignore: must_be_immutable
class DemoReceiptScreen extends StatelessWidget {
  Map<String, String> details = {};
  DemoReceiptScreen({required this.details});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoReceiptController>(
        init: DemoReceiptController(details: details),
        builder: (controller) => ScreenX(
            lightStatusBar: true,
            headerView: NavigationBarX(
              title: 'Receipt',
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
                backgroundColor: ColorX.lightGray.withOpacity(0.25),
                child: Column(children: [
                  Expanded(
                    child: SingleChildScrollView(
                        physics: ClampingScrollPhysics(),
                        child: Column(children: [
                          Screenshot(
                              controller: controller.screenshotController,
                              child: ContainerX(
                                  padding: EdgeInsets.all(24.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 24.0, right: 24.0),
                                          child: Column(
                                            children: [
                                              ImageX(
                                                backgroundColor: ColorX.green,
                                                padding: EdgeInsets.all(8.0),
                                                faIcon: FontAwesomeIcons.check,
                                                color: ColorX.white,
                                                width: 48.0,
                                                height: 48.0,
                                                fit: BoxFit.contain,
                                                cornerRadius: 32.0,
                                              ),
                                            ],
                                          )),
                                      SizedBox(height: 24.0),
                                      ContainerX(
                                        backgroundColor: ColorX.white,
                                        cornerRadius: 12.0,
                                        padding: EdgeInsets.all(24.0),
                                        child: ListView.separated(
                                          physics: ClampingScrollPhysics(),
                                          shrinkWrap: true,
                                          padding: EdgeInsets.zero,
                                          separatorBuilder: (context, index) =>
                                              SizedBox(height: 8.0),
                                          itemCount: controller.details.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return DemoReceiptWidget(
                                                k: controller.details.keys
                                                    .elementAt(index),
                                                v: controller.details.values
                                                    .elementAt(index));
                                          },
                                        ),
                                      ),
                                    ],
                                  ))),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 24.0, right: 24.0, bottom: 24.0),
                              child: Column(
                                children: [
                                  ButtonX(
                                      title: 'Share',
                                      titleColor: ColorX.black,
                                      backgroundColor: ColorX.white,
                                      borderWidth: 1.0,
                                      borderColor: ColorX.lightGray,
                                      onClicked: () {
                                        controller.btnShareClicked();
                                      }),
                                  SizedBox(height: 12.0),
                                  SizedBox(
                                      height: MediaQuery.of(Get.context!)
                                          .padding
                                          .bottom),
                                ],
                              )),
                        ])),
                  ),
                ]))));
  }
}
