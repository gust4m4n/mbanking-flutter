import '../../widgets/all_widgets.dart';
import '../mbx_sof_sheet/mbx_sof_widget.dart';
import 'mbx_pbb_controller.dart';

class MbxPBBScreen extends StatelessWidget {
  MbxPBBScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxPBBController>(
        init: MbxPBBController(),
        builder: (controller) => MbxScreen(
            title: 'PBB',
            scrollingBody: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                            left: 12.0, top: 8.0, right: 12.0, bottom: 8.0),
                        borderWidth: 1.0,
                        borderColor: ColorX.lightGray,
                        cornerRadius: 8.0,
                        child: Row(children: [
                          Expanded(
                            child: MbxSofWidget(
                              account: controller.sof,
                              borders: false,
                              onEyeClicked: () {
                                controller.btnSofEyeClicked();
                              },
                            ),
                          ),
                          ContainerX(width: 8.0),
                          ButtonX(
                              faIcon: FontAwesomeIcons.chevronDown,
                              backgroundColor: ColorX.transparent,
                              faWidth: 16.0,
                              faHeight: 16.0,
                              title: '',
                              width: 40.0,
                              height: 40.0,
                              borderWidth: 0.5,
                              borderColor: ColorX.gray,
                              onClicked: () {
                                controller.btnSofClicked();
                              })
                        ])),
                  ],
                ),
                ContainerX(height: 12.0),
                ContainerError(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextX(
                        'NOMOR OBJEK PAJAK',
                        color: ColorX.black,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.start,
                      ),
                      ContainerX(height: 4.0),
                      TextFieldX(
                        hint: 'Masukkan nomor objek pajak',
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        readOnly: false,
                        controller: controller.amountController,
                        focusNode: controller.amountNode,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                  error: controller.amountError,
                ),
                ContainerX(height: 12.0),
                ContainerError(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextX(
                        'TAHUN',
                        color: ColorX.black,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.start,
                      ),
                      ContainerX(height: 4.0),
                      ContainerX(
                          width: double.infinity,
                          padding: EdgeInsets.only(
                              left: 12.0, top: 8.0, right: 12.0, bottom: 8.0),
                          borderWidth: 1.0,
                          borderColor: ColorX.lightGray,
                          cornerRadius: 8.0,
                          child: Row(children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextX(
                                    controller.selectedYear.isNotEmpty
                                        ? controller.selectedYear
                                        : '-',
                                    color: ColorX.black,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w500,
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
                                title: '',
                                width: 40.0,
                                height: 40.0,
                                borderWidth: 0.5,
                                borderColor: ColorX.gray,
                                onClicked: () {
                                  controller.btnPickYearClicked();
                                })
                          ])),
                    ],
                  ),
                  error: controller.destError,
                ),
                ContainerX(height: 16.0),
                ButtonX(
                  backgroundColor: ColorX.theme,
                  title: 'Lanjut',
                  disabledBackgroundColor: ColorX.theme.withOpacity(0.1),
                  enabled: controller.readyToSubmit(),
                  onClicked: () {
                    controller.btnNextClicked();
                  },
                ),
              ],
            )));
  }
}
