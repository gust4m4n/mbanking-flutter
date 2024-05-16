import '../../widgets/all_widgets.dart';
import '../mbx_sof_sheet/mbx_sof_widget.dart';
import 'mbx_cardless_controller.dart';
import 'mbx_cardless_denom_widget.dart';

class MbxCardlessScreen extends StatelessWidget {
  MbxCardlessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxCardlessController>(
        init: MbxCardlessController(),
        builder: (controller) => MbxScreen(
            title: 'Tarik Tunai',
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
                        controller: controller.amountController,
                        focusNode: controller.amountNode,
                        onChanged: (value) {
                          controller.amountChanged(value);
                        },
                      ),
                    ],
                  ),
                  error: controller.amountError,
                ),
                ContainerX(height: 12.0),
                GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: ClampingScrollPhysics(),
                  itemCount: controller.denomsVM.list.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    childAspectRatio: 2.0,
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return MbxCardlessDenomWidget(
                      nominal: controller.denomsVM.list[index].nominal,
                      onClicked: () {
                        controller.amountChanged(
                            '${controller.denomsVM.list[index].nominal}');
                      },
                    );
                  },
                ),
                ContainerX(height: 16.0),
                ButtonX(
                  backgroundColor: ColorX.theme,
                  title: 'Lanjut',
                  enabled: controller.readyToSubmit(),
                  onClicked: () {
                    controller.btnNextClicked();
                  },
                ),
              ],
            )));
  }
}
