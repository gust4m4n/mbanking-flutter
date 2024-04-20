import '../../widgets/all_widgets.dart';
import 'mbx_receipt_cell.dart';
import 'mbx_receipt_controller.dart';

class MbxReceiptScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxReceiptController>(
        init: MbxReceiptController(),
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
                backgroundColor: ColorX.theme,
                child: Column(children: [
                  Expanded(
                    child: ContainerX(
                        child: controller.loading
                            ? Center(
                                child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        ColorX.white)),
                              )
                            : Scrollbar(
                                child: SingleChildScrollView(
                                    physics: ClampingScrollPhysics(),
                                    child: ContainerX(
                                        backgroundColor: ColorX.white,
                                        child: Column(children: [
                                          Screenshot(
                                              controller: controller
                                                  .screenshotController,
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        begin:
                                                            Alignment.topCenter,
                                                        end: Alignment
                                                            .bottomCenter,
                                                        stops: [
                                                          0.0,
                                                          1.0
                                                        ],
                                                        colors: [
                                                          ColorX.theme,
                                                          ColorX.white,
                                                        ]),
                                                  ),
                                                  padding: EdgeInsets.only(
                                                      left: 16.0,
                                                      top: 16.0,
                                                      right: 16.0,
                                                      bottom: 16.0),
                                                  child: Container(
                                                      padding:
                                                          EdgeInsets.all(32.0),
                                                      decoration: BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            image: AssetImage(
                                                                'lib/images/mbx_sticker.png'),
                                                            repeat: ImageRepeat
                                                                .repeat,
                                                          ),
                                                          border: Border.all(
                                                              color:
                                                                  ColorX.black,
                                                              width: 0.5),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      16.0))),
                                                      child: Column(children: [
                                                        Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              ImageX(
                                                                url:
                                                                    'lib/images/mbx_logo.png',
                                                                width: 42.0,
                                                                height: 42.0,
                                                              ),
                                                              TextX(
                                                                'Bank XYZ',
                                                                fontSize: 20.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: ColorX
                                                                    .black,
                                                              ),
                                                            ]),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 0.0,
                                                                    top: 4.0,
                                                                    right: 0.0,
                                                                    bottom:
                                                                        4.0),
                                                            child: DashedDividerX(
                                                                dashColor:
                                                                    ColorX.gray,
                                                                dashWidth: 6.0,
                                                                dashHeight:
                                                                    1.0)),
                                                        ContainerX(height: 8.0),
                                                        ContainerX(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  4.0),
                                                          borderWidth: 2.0,
                                                          borderColor:
                                                              ColorX.green,
                                                          width: 70.0,
                                                          height: 70.0,
                                                          cornerRadius: 35.0,
                                                          child: Center(
                                                              child: ImageX(
                                                            faIcon:
                                                                FontAwesomeIcons
                                                                    .check,
                                                            color: ColorX.white,
                                                            width: 60.0,
                                                            height: 60.0,
                                                            cornerRadius: 30.0,
                                                            backgroundColor:
                                                                ColorX.green,
                                                            padding:
                                                                EdgeInsets.all(
                                                                    12.0),
                                                          )),
                                                        ),
                                                        ContainerX(
                                                            height: 16.0),
                                                        TextX(
                                                          controller
                                                              .receipt.title,
                                                          textAlign:
                                                              TextAlign.center,
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          maxLines: 8,
                                                        ),
                                                        TextX(
                                                          controller
                                                              .receipt.amount,
                                                          textAlign:
                                                              TextAlign.center,
                                                          fontSize: 24.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          maxLines: 8,
                                                        ),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 0.0,
                                                                    top: 4.0,
                                                                    right: 0.0,
                                                                    bottom:
                                                                        4.0),
                                                            child: DashedDividerX(
                                                                dashColor:
                                                                    ColorX.gray,
                                                                dashWidth: 6.0,
                                                                dashHeight:
                                                                    1.0)),
                                                        ListView.builder(
                                                            shrinkWrap: true,
                                                            padding:
                                                                EdgeInsets.zero,
                                                            physics:
                                                                ClampingScrollPhysics(),
                                                            itemCount:
                                                                controller
                                                                    .receipt
                                                                    .details
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              final detail =
                                                                  controller
                                                                          .receipt
                                                                          .details[
                                                                      index];
                                                              return MbxReceiptCell(
                                                                  detail);
                                                            }),
                                                      ])))),
                                          ContainerX(
                                            backgroundColor: ColorX.white,
                                            padding: EdgeInsets.only(
                                                left: 16.0, right: 16.0),
                                            child: Center(
                                              child: Wrap(
                                                children: <Widget>[
                                                  ButtonX(
                                                    title: 'Share',
                                                    titleColor: ColorX.black,
                                                    fontSize: 13.0,
                                                    fontWeight: FontWeight.w600,
                                                    backgroundColor:
                                                        ColorX.transparent,
                                                    borderWidth: 1.0,
                                                    borderColor: ColorX.black,
                                                    width: 120.0,
                                                    height: 32.0,
                                                    cornerRadius: 16.0,
                                                    onClicked: controller
                                                        .btnShareClicked,
                                                  ),
                                                  ContainerX(width: 8.0),
                                                  ButtonX(
                                                    title: 'Download',
                                                    titleColor: ColorX.black,
                                                    fontSize: 13.0,
                                                    fontWeight: FontWeight.w600,
                                                    backgroundColor:
                                                        ColorX.transparent,
                                                    borderWidth: 1.0,
                                                    borderColor: ColorX.black,
                                                    width: 120.0,
                                                    height: 32.0,
                                                    cornerRadius: 16.0,
                                                    onClicked: controller
                                                        .btnDownloadClicked,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          ContainerX(
                                              height: 16.0 +
                                                  MediaQuery.of(context)
                                                      .padding
                                                      .bottom),
                                        ]))))),
                  )
                ]))));
  }
}
