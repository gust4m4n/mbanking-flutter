import '../../widgets/all_widgets.dart';
import 'mbx_transfer_p2p_controller.dart';

class MbxTransferP2PScreen extends StatelessWidget {
  MbxTransferP2PScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxTransfeP2PrController>(
        init: MbxTransfeP2PrController(),
        builder: (controller) => ScreenX(
            lightStatusBar: true,
            headerView: NavigationBarX(
              title: 'Transfer Antar Rekening',
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextX(
                                    controller.dest.name.isNotEmpty
                                        ? controller.dest.name
                                        : '-',
                                    color: ColorX.black,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w400,
                                    textAlign: TextAlign.start,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 6.0, bottom: 6.0),
                                    child: ContainerX(
                                        height: 0.5,
                                        backgroundColor: ColorX.lightGray),
                                  ),
                                  TextX(
                                    controller.dest.account.isNotEmpty
                                        ? controller.dest.account
                                        : '-',
                                    color: ColorX.black,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w400,
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              )),
                          ContainerX(height: 8.0),
                          Row(
                            children: [
                              Expanded(
                                  child: ButtonX(
                                title: 'Pilih Tujuan',
                                titleColor: ColorX.black,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w600,
                                backgroundColor: ColorX.transparent,
                                borderWidth: 0.5,
                                borderColor: ColorX.gray,
                                width: 120.0,
                                height: 32.0,
                                cornerRadius: 8.0,
                                onClicked: () {
                                  controller.btnPickDestinationClicked();
                                },
                              )),
                              ContainerX(width: 8.0),
                              Expanded(
                                child: ButtonX(
                                    title: 'Tujuan Baru',
                                    titleColor: ColorX.black,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w600,
                                    backgroundColor: ColorX.transparent,
                                    borderWidth: 0.5,
                                    borderColor: ColorX.gray,
                                    width: 120.0,
                                    height: 32.0,
                                    cornerRadius: 8.0,
                                    onClicked: () {
                                      controller.btnClearClicked();
                                    }),
                              ),
                            ],
                          ),
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
                          TextFieldX(
                            hint: 'Pilih sumber dana',
                            obscureText: false,
                            keyboardType: TextInputType.text,
                            readOnly: false,
                            //controller: controller.txtUsernameController,
                            //focusNode: controller.txtUsernameNode,
                          ),
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
