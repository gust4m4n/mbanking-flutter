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
            bodyView: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextX(
                        'REKENING TUJUAN',
                        color: ColorX.white,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.start,
                      ),
                      ContainerX(height: 4.0),
                      TextFieldX(
                        hint: '',
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        readOnly: false,
                        controller: controller.txtAccountController,
                        focusNode: controller.txtAccountNode,
                      ),
                      ContainerX(height: 8.0),
                      ButtonX(
                        title: 'Tujuan Baru',
                        titleColor: ColorX.white,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w600,
                        backgroundColor: ColorX.transparent,
                        borderWidth: 1.0,
                        borderColor: ColorX.white,
                        width: 120.0,
                        height: 32.0,
                        cornerRadius: 8.0,
                        //onClicked: controller.btnShareClicked,
                      ),
                      ContainerX(height: 12.0),
                      TextX(
                        'JUMLAH',
                        color: ColorX.white,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.start,
                      ),
                      ContainerX(height: 4.0),
                      TextFieldX(
                        hint: '',
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        readOnly: false,
                        controller: controller.txtAmountController,
                        focusNode: controller.txtAmountNode,
                      ),
                      ContainerX(height: 12.0),
                      TextX(
                        'BERITA',
                        color: ColorX.white,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.start,
                      ),
                      ContainerX(height: 4.0),
                      TextFieldX(
                        hint: '',
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        readOnly: false,
                        controller: controller.txtMessageController,
                        focusNode: controller.txtMessageNode,
                      ),
                      ContainerX(height: 12.0),
                      TextX(
                        'SUMBER DANA',
                        color: ColorX.white,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.start,
                      ),
                      ContainerX(height: 4.0),
                      TextFieldX(
                        hint: '',
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        readOnly: false,
                        //controller: controller.txtUsernameController,
                        //focusNode: controller.txtUsernameNode,
                      ),
                      ContainerX(height: 12.0),
                      TextX(
                        'PERHATIAN',
                        color: ColorX.white,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.start,
                      ),
                      ContainerX(height: 4.0),
                      TextX(
                        'Bank tidak bertanggung jawab atas segala kerugian yang disebabkan oleh kesalahan pengisian data.',
                        color: ColorX.white,
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
                  )),
            )));
  }
}
