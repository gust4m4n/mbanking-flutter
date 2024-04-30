import '../../widgets/all_widgets.dart';
import '../mbx_sof_sheet/mbx_sof_widget.dart';
import 'mbx_transfer_p2bank_controller.dart';

class MbxTransferP2BankScreen extends StatelessWidget {
  MbxTransferP2BankScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxTransfeP2BankController>(
        init: MbxTransfeP2BankController(),
        builder: (controller) => ScreenX(
            lightStatusBar: true,
            headerView: NavigationBarX(
              title: 'Transfer Antar Bank',
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
                child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Padding(
                  padding: EdgeInsets.only(
                      left: 16.0,
                      top: 16.0,
                      right: 16.0,
                      bottom:
                          16.0 + MediaQuery.of(Get.context!).padding.bottom),
                  child: ContainerX(
                      backgroundColor: ColorX.white,
                      cornerRadius: 16.0,
                      borderWidth: 0.5,
                      borderColor: ColorX.gray,
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextX(
                            'REKENING TUJUAN',
                            color: ColorX.black,
                            fontSize: 13.0,
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.start,
                          ),
                          ContainerX(height: 4.0),
                          ContainerX(
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                  left: 12.0,
                                  top: 8.0,
                                  right: 12.0,
                                  bottom: 8.0),
                              borderWidth: 1.0,
                              borderColor: ColorX.lightGray,
                              cornerRadius: 8.0,
                              child: Row(children: [
                                ImageX(
                                  url: controller.dest.bank_icon,
                                  backgroundColor: ColorX.transparent,
                                  width: 50.0,
                                  height: 50.0,
                                  cornerRadius: 8.0,
                                  borderWidth: 0.5,
                                  borderColor: ColorX.gray,
                                  fit: BoxFit.contain,
                                ),
                                ContainerX(width: 8.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextX(
                                        controller.dest.name.isNotEmpty
                                            ? controller.dest.name
                                            : '-',
                                        color: ColorX.black,
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w500,
                                        textAlign: TextAlign.start,
                                      ),
                                      TextX(
                                        controller.dest.account.isNotEmpty
                                            ? controller.dest.account
                                            : '-',
                                        color: ColorX.black,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
                                        textAlign: TextAlign.start,
                                      ),
                                      TextX(
                                        controller.dest.account.isNotEmpty
                                            ? controller.dest.bank
                                            : '-',
                                        color: ColorX.black,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w400,
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                ),
                                ContainerX(width: 8.0),
                                ButtonX(
                                    faIcon: FontAwesomeIcons.chevronDown,
                                    backgroundColor: ColorX.transparent,
                                    faWidth: 16.0,
                                    faHeight: 16.0,
                                    width: 40.0,
                                    height: 40.0,
                                    borderWidth: 0.5,
                                    borderColor: ColorX.gray,
                                    onClicked: () {
                                      controller.btnPickDestinationClicked();
                                    })
                              ])),
                          ContainerX(height: 12.0),
                          TextX(
                            'JUMLAH',
                            color: ColorX.black,
                            fontSize: 13.0,
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.start,
                          ),
                          ContainerX(height: 4.0),
                          TextFieldX(
                            hint: 'Nominal transfer',
                            obscureText: false,
                            keyboardType: TextInputType.number,
                            readOnly: false,
                            controller: controller.txtAmountController,
                            focusNode: controller.txtAmountNode,
                            onChanged: (value) {
                              controller.txtAmountChanged(value);
                            },
                          ),
                          ContainerX(height: 12.0),
                          TextX(
                            'LAYANAN TRANSFER',
                            color: ColorX.black,
                            fontSize: 13.0,
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.start,
                          ),
                          ContainerX(height: 4.0),
                          ContainerX(
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                  left: 12.0,
                                  top: 8.0,
                                  right: 12.0,
                                  bottom: 8.0),
                              borderWidth: 1.0,
                              borderColor: ColorX.lightGray,
                              cornerRadius: 8.0,
                              child: Row(children: [
                                Expanded(
                                  child: TextX(
                                    controller.sof.name.isNotEmpty
                                        ? controller.sof.name
                                        : '-',
                                    color: ColorX.black,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w500,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                ContainerX(width: 8.0),
                                ButtonX(
                                    faIcon: FontAwesomeIcons.chevronDown,
                                    backgroundColor: ColorX.transparent,
                                    faWidth: 16.0,
                                    faHeight: 16.0,
                                    width: 40.0,
                                    height: 40.0,
                                    borderWidth: 0.5,
                                    borderColor: ColorX.gray,
                                    onClicked: () {
                                      controller.btnTransferServiceClicked();
                                    })
                              ])),
                          ContainerX(height: 12.0),
                          TextX(
                            'BERITA',
                            color: ColorX.black,
                            fontSize: 13.0,
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.start,
                          ),
                          ContainerX(height: 4.0),
                          TextFieldX(
                            hint: 'Pesan untuk penerima transfer',
                            obscureText: false,
                            keyboardType: TextInputType.text,
                            readOnly: false,
                            controller: controller.txtMessageController,
                            focusNode: controller.txtMessageNode,
                          ),
                          ContainerX(height: 12.0),
                          TextX(
                            'SUMBER DANA',
                            color: ColorX.black,
                            fontSize: 13.0,
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.start,
                          ),
                          ContainerX(height: 4.0),
                          ContainerX(
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                  left: 12.0,
                                  top: 8.0,
                                  right: 12.0,
                                  bottom: 8.0),
                              borderWidth: 1.0,
                              borderColor: ColorX.lightGray,
                              cornerRadius: 8.0,
                              child: Row(children: [
                                Expanded(
                                  child: MbxSofWidget(
                                    account: controller.sof,
                                    borders: false,
                                    onEyeClicked: () {
                                      controller.btnEyeClicked();
                                    },
                                  ),
                                ),
                                ContainerX(width: 8.0),
                                ButtonX(
                                    faIcon: FontAwesomeIcons.chevronDown,
                                    backgroundColor: ColorX.transparent,
                                    faWidth: 16.0,
                                    faHeight: 16.0,
                                    width: 40.0,
                                    height: 40.0,
                                    borderWidth: 0.5,
                                    borderColor: ColorX.gray,
                                    onClicked: () {
                                      controller.btnSofClicked();
                                    })
                              ])),
                          ContainerX(height: 12.0),
                          TextX(
                            'PERHATIAN',
                            color: ColorX.black,
                            fontSize: 13.0,
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.start,
                          ),
                          ContainerX(height: 4.0),
                          TextX(
                            'Bank tidak bertanggung jawab atas segala kerugian yang disebabkan oleh kesalahan pengisian data.',
                            color: ColorX.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.start,
                            maxLines: 16,
                          ),
                          ContainerX(height: 16.0),
                          ButtonX(
                            backgroundColor: ColorX.theme,
                            title: 'Lanjut',
                            onClicked: () {
                              controller.btnNextClicked();
                            },
                          ),
                        ],
                      ))),
            ))));
  }
}
