import '../../models/mbx_qris_inquiry_model.dart';
import '../../widgets/all_widgets.dart';
import '../mbx_sof_sheet/mbx_sof_widget.dart';
import 'mbx_qris_amount_controller.dart';

class MbxQRISAmountScreen extends StatelessWidget {
  final MbxQRISInquiryModel inquiry;
  MbxQRISAmountScreen({required this.inquiry});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxQRISAmountController>(
        init: MbxQRISAmountController(inquiry: inquiry),
        builder: (controller) => ScreenX(
            lightStatusBar: true,
            headerView: NavigationBarX(
              title: 'QRIS',
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
            bodyView: Column(children: [
              TopContainerX(),
              Expanded(
                  child: ContainerX(
                      child: controller.receiptVM.loading
                          ? Center(
                              child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      ColorX.gray)),
                            )
                          : Scrollbar(
                              child: SingleChildScrollView(
                                  physics: ClampingScrollPhysics(),
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 16.0,
                                          top: 0.0,
                                          right: 16.0,
                                          bottom: 16.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextX(
                                              'PEMBAYARAN KEPADA',
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w500,
                                              color: ColorX.black,
                                            ),
                                            ContainerX(height: 4.0),
                                            ContainerX(
                                                width: double.infinity,
                                                backgroundColor: ColorX.theme,
                                                borderWidth: 1.0,
                                                borderColor: ColorX.lightGray,
                                                cornerRadius: 12.0,
                                                padding: EdgeInsets.all(8.0),
                                                child: Column(
                                                  children: [
                                                    TextX(
                                                      inquiry.merchant_name,
                                                      fontSize: 24.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      textAlign:
                                                          TextAlign.center,
                                                      color: ColorX.white,
                                                      maxLines: 8,
                                                    ),
                                                    TextX(
                                                      inquiry.merchant_code,
                                                      fontSize: 13.0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      textAlign:
                                                          TextAlign.center,
                                                      color: ColorX.white,
                                                      maxLines: 8,
                                                    ),
                                                  ],
                                                )),
                                            ContainerX(height: 8.0),
                                            ContainerX(
                                              backgroundColor:
                                                  ColorX.theme.withOpacity(0.1),
                                              width: double.infinity,
                                              cornerRadius: 8.0,
                                              padding: EdgeInsets.all(
                                                12.0,
                                              ),
                                              child: Column(children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: TextX(
                                                        'Pengakuisisi',
                                                        color: ColorX.black,
                                                        fontSize: 13.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        textAlign:
                                                            TextAlign.start,
                                                        maxLines: 8,
                                                      ),
                                                    ),
                                                    ContainerX(width: 24.0),
                                                    Expanded(
                                                        child: TextX(
                                                      inquiry.acquirer,
                                                      color: ColorX.black,
                                                      fontSize: 13.0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      textAlign: TextAlign.end,
                                                      maxLines: 8,
                                                    )),
                                                  ],
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: TextX(
                                                        'Merchant PAN',
                                                        color: ColorX.black,
                                                        fontSize: 13.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        textAlign:
                                                            TextAlign.start,
                                                        maxLines: 8,
                                                      ),
                                                    ),
                                                    ContainerX(width: 24.0),
                                                    Expanded(
                                                        child: TextX(
                                                      inquiry.mpan,
                                                      color: ColorX.black,
                                                      fontSize: 13.0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      textAlign: TextAlign.end,
                                                      maxLines: 8,
                                                    )),
                                                  ],
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: TextX(
                                                        'No. Referensi',
                                                        color: ColorX.black,
                                                        fontSize: 13.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        textAlign:
                                                            TextAlign.start,
                                                        maxLines: 8,
                                                      ),
                                                    ),
                                                    ContainerX(width: 24.0),
                                                    Expanded(
                                                        child: TextX(
                                                      inquiry.ref,
                                                      color: ColorX.black,
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      textAlign: TextAlign.end,
                                                      maxLines: 8,
                                                    )),
                                                  ],
                                                ),
                                              ]),
                                            ),
                                            ContainerX(height: 8.0),
                                            TextX(
                                              'SUMBER DANA',
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w700,
                                              color: ColorX.black,
                                              textAlign: TextAlign.start,
                                            ),
                                            ContainerX(height: 4.0),
                                            ContainerX(
                                                width: double.infinity,
                                                height: 80.0,
                                                borderWidth: 1.0,
                                                borderColor: ColorX.lightGray,
                                                cornerRadius: 8.0,
                                                child: Row(
                                                  children: [
                                                    InkWellX(
                                                      onClicked: () {
                                                        controller
                                                            .btnSofClicked();
                                                      },
                                                      child: ContainerX(
                                                        backgroundColor: ColorX
                                                            .theme
                                                            .withOpacity(0.1),
                                                        width: 50.0,
                                                        child: Center(
                                                            child: ImageX(
                                                          faIcon:
                                                              FontAwesomeIcons
                                                                  .chevronDown,
                                                          color: ColorX.black,
                                                          width: 24.0,
                                                          height: 24.0,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  4.0),
                                                        )),
                                                      ),
                                                    ),
                                                    ContainerX(
                                                        width: 1.0,
                                                        height: 90.0,
                                                        backgroundColor:
                                                            ColorX.lightGray),
                                                    ContainerX(width: 12.0),
                                                    Expanded(
                                                      child: MbxSofWidget(
                                                        account:
                                                            controller.account,
                                                        borders: false,
                                                        onClicked: () {},
                                                      ),
                                                    )
                                                  ],
                                                )),
                                            Container(height: 8.0),
                                            TextX(
                                              'NOMINAL',
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w700,
                                              color: ColorX.black,
                                              textAlign: TextAlign.start,
                                            ),
                                            ContainerX(height: 4.0),
                                            ContainerX(
                                                width: double.infinity,
                                                height: 48.0,
                                                borderWidth: 1.0,
                                                borderColor: ColorX.lightGray,
                                                cornerRadius: 8.0,
                                                child: Row(
                                                  children: [
                                                    ContainerX(
                                                      backgroundColor: ColorX
                                                          .theme
                                                          .withOpacity(0.1),
                                                      width: 50.0,
                                                      child: Center(
                                                          child: TextX(
                                                        'Rp',
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: ColorX.gray,
                                                        textAlign:
                                                            TextAlign.start,
                                                      )),
                                                    ),
                                                    ContainerX(
                                                        width: 1.0,
                                                        height: 48.0,
                                                        backgroundColor:
                                                            ColorX.lightGray),
                                                    ContainerX(width: 12.0),
                                                    Expanded(
                                                      child: TextFieldX(
                                                        hint: '0',
                                                        borderWidth: 0.0,
                                                        borderColor:
                                                            ColorX.transparent,
                                                        obscureText: false,
                                                        fontSize: 24.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        readOnly: false,
                                                        controller: controller
                                                            .txtAmountController,
                                                        focusNode: controller
                                                            .txtAmountNode,
                                                        inputFormatters: <TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .digitsOnly
                                                        ],
                                                        onChanged: (value) {
                                                          controller
                                                              .txtAmountOnChanged(
                                                                  value);
                                                        },
                                                      ),
                                                    ),
                                                    ContainerX(width: 12.0),
                                                  ],
                                                ))
                                          ]))),
                            ))),
              Padding(
                padding: EdgeInsets.only(
                    left: 16.0,
                    top: 16.0,
                    right: 16.0,
                    bottom: 16.0 + MediaQuery.of(Get.context!).padding.bottom),
                child: ButtonX(
                  title: 'Lanjut',
                  backgroundColor: ColorX.theme,
                  disabledBackgroundColor: ColorX.theme.withOpacity(0.2),
                  enabled: controller.amount > 0,
                  onClicked: () {
                    controller.btnNextClicked();
                  },
                ),
              ),
            ])));
  }
}
