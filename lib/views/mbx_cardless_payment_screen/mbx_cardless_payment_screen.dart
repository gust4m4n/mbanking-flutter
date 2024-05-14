import '../../widgets/all_widgets.dart';
import 'mbx_cardless_payment_controller.dart';

class MbxCardlessPaymentScreen extends StatelessWidget {
  MbxCardlessPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxCardlessPaymentController>(
        init: MbxCardlessPaymentController(),
        builder: (controller) => MbxScreen(
            title: 'Tarik Tunai',
            backAction: () {
              controller.btnBackClicked();
            },
            scrollingBody: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextX(
                  'Ikuti instruksi di bawah ini untuk melakukan penarikan tunai di ATM.',
                  color: ColorX.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                  maxLines: 16,
                ),
                ContainerX(height: 12.0),
                ListView(shrinkWrap: true, padding: EdgeInsets.zero, children: [
                  Row(
                    children: [
                      ContainerX(
                        width: 32.0,
                        height: 32.0,
                        cornerRadius: 16.0,
                        borderWidth: 1.0,
                        borderColor: ColorX.black,
                        child: Center(
                          child: TextX(
                            '1',
                            color: ColorX.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            textAlign: TextAlign.start,
                            maxLines: 16,
                          ),
                        ),
                      ),
                      ContainerX(width: 8.0),
                      Expanded(
                        child: TextX(
                          'Pilih menu "Tarik Tunai" di layar ATM.',
                          color: ColorX.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.start,
                          maxLines: 16,
                        ),
                      ),
                    ],
                  ),
                  ContainerX(height: 8.0),
                  Row(
                    children: [
                      ContainerX(
                        width: 32.0,
                        height: 32.0,
                        cornerRadius: 16.0,
                        borderWidth: 1.0,
                        borderColor: ColorX.black,
                        child: Center(
                          child: TextX(
                            '2',
                            color: ColorX.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            textAlign: TextAlign.start,
                            maxLines: 16,
                          ),
                        ),
                      ),
                      ContainerX(width: 8.0),
                      Expanded(
                        child: TextX(
                          'Masukkan 06111111111111 untk nomor handphone.',
                          color: ColorX.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.start,
                          maxLines: 16,
                        ),
                      ),
                    ],
                  ),
                  ContainerX(height: 8.0),
                  Row(
                    children: [
                      ContainerX(
                        width: 32.0,
                        height: 32.0,
                        cornerRadius: 16.0,
                        borderWidth: 1.0,
                        borderColor: ColorX.black,
                        child: Center(
                          child: TextX(
                            '3',
                            color: ColorX.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            textAlign: TextAlign.start,
                            maxLines: 16,
                          ),
                        ),
                      ),
                      ContainerX(width: 8.0),
                      Expanded(
                        child: TextX(
                          'Masukkan 123456 untk kode transaksi.',
                          color: ColorX.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.start,
                          maxLines: 16,
                        ),
                      ),
                    ],
                  ),
                  ContainerX(height: 8.0),
                  Row(
                    children: [
                      ContainerX(
                        width: 32.0,
                        height: 32.0,
                        cornerRadius: 16.0,
                        borderWidth: 1.0,
                        borderColor: ColorX.black,
                        child: Center(
                          child: TextX(
                            '4',
                            color: ColorX.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            textAlign: TextAlign.start,
                            maxLines: 16,
                          ),
                        ),
                      ),
                      ContainerX(width: 8.0),
                      Expanded(
                        child: TextX(
                          'Ambil uang tunai yang keluar dan struk transaksi dari mesin ATM.',
                          color: ColorX.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.start,
                          maxLines: 16,
                        ),
                      ),
                    ],
                  ),
                ]),
                ContainerX(height: 16.0),
                ButtonX(
                  backgroundColor: ColorX.theme,
                  title: 'Selesai',
                  onClicked: () {
                    controller.btnBackClicked();
                  },
                ),
              ],
            )));
  }
}
