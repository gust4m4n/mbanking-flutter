import '../../widgets/all_widgets.dart';
import 'mbx_otp_button.dart';
import 'mbx_otp_dot.dart';
import 'mbx_otp_sheet_controller.dart';

// ignore: must_be_immutable
class MbxOtpSheet extends GetWidget<MbxOtpSheetController> {
  final String title;
  final String description;
  final Function(String code) onSubmit;
  TextEditingController pinController = TextEditingController();

  MbxOtpSheet({
    required this.title,
    required this.description,
    required this.onSubmit,
  });

  static Future<T?> show<T>(
      {required String title,
      required String description,
      required Function(String code) onSubmit}) {
    FocusManager.instance.primaryFocus?.unfocus();
    final sheet =
        MbxOtpSheet(title: title, description: description, onSubmit: onSubmit);
    return SheetX.showWithGrip(
        backgroundColor: const Color.fromARGB(255, 130, 102, 102),
        cornerRadius: 16.0,
        widget: sheet,
        title: title);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxOtpSheetController>(
        init: MbxOtpSheetController(onSubmit: onSubmit),
        builder: (controller) => ContainerX(
            backgroundColor: ColorX.white,
            child: Wrap(alignment: WrapAlignment.center, children: [
              Visibility(
                visible: description.isNotEmpty,
                child: Padding(
                  padding: EdgeInsets.only(left: 48.0, right: 48.0),
                  child: TextX(
                    description,
                    color: ColorX.black,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                  ),
                ),
              ),
              ContainerX(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MbxOtpDot(
                    number:
                        controller.code.length >= 1 ? controller.code[0] : '',
                  ),
                  ContainerX(width: 8.0),
                  MbxOtpDot(
                      number: controller.code.length >= 2
                          ? controller.code[1]
                          : ''),
                  ContainerX(width: 8.0),
                  MbxOtpDot(
                      number: controller.code.length >= 3
                          ? controller.code[2]
                          : ''),
                  ContainerX(width: 8.0),
                  MbxOtpDot(
                      number: controller.code.length >= 4
                          ? controller.code[3]
                          : ''),
                  ContainerX(width: 8.0),
                  MbxOtpDot(
                      number: controller.code.length >= 5
                          ? controller.code[4]
                          : ''),
                  ContainerX(width: 8.0),
                  MbxOtpDot(
                      number: controller.code.length >= 6
                          ? controller.code[5]
                          : ''),
                ],
              ),
              ContainerX(height: 16.0),
              Visibility(
                visible: controller.error.isNotEmpty,
                child: Padding(
                  padding: EdgeInsets.only(left: 48.0, right: 48.0),
                  child: TextX(
                    controller.error,
                    color: ColorX.red,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                  ),
                ),
              ),
              ContainerX(
                backgroundColor: ColorX.transparent,
                padding: EdgeInsets.only(
                    left: 16.0, top: 0.0, right: 16.0, bottom: 0.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        MbxOtpButton(
                          title: '1',
                          onClicked: () {
                            controller.btnKeypadClicked('1');
                          },
                        ),
                        ContainerX(width: 4.0),
                        MbxOtpButton(
                          title: '2',
                          onClicked: () {
                            controller.btnKeypadClicked('2');
                          },
                        ),
                        ContainerX(width: 4.0),
                        MbxOtpButton(
                          title: '3',
                          onClicked: () {
                            controller.btnKeypadClicked('3');
                          },
                        ),
                      ],
                    ),
                    ContainerX(height: 4.0),
                    Row(
                      children: [
                        MbxOtpButton(
                          title: '4',
                          onClicked: () {
                            controller.btnKeypadClicked('4');
                          },
                        ),
                        ContainerX(width: 4.0),
                        MbxOtpButton(
                          title: '5',
                          onClicked: () {
                            controller.btnKeypadClicked('5');
                          },
                        ),
                        ContainerX(width: 4.0),
                        MbxOtpButton(
                          title: '6',
                          onClicked: () {
                            controller.btnKeypadClicked('6');
                          },
                        ),
                      ],
                    ),
                    ContainerX(height: 4.0),
                    Row(
                      children: [
                        MbxOtpButton(
                          title: '7',
                          onClicked: () {
                            controller.btnKeypadClicked('7');
                          },
                        ),
                        ContainerX(width: 4.0),
                        MbxOtpButton(
                          title: '8',
                          onClicked: () {
                            controller.btnKeypadClicked('8');
                          },
                        ),
                        ContainerX(width: 4.0),
                        MbxOtpButton(
                          title: '9',
                          onClicked: () {
                            controller.btnKeypadClicked('9');
                          },
                        ),
                      ],
                    ),
                    ContainerX(height: 4.0),
                    Row(
                      children: [
                        MbxOtpButton(
                          title: '',
                          onClicked: () {},
                        ),
                        ContainerX(width: 4.0),
                        MbxOtpButton(
                          title: '0',
                          onClicked: () {
                            controller.btnKeypadClicked('0');
                          },
                        ),
                        ContainerX(width: 4.0),
                        MbxOtpButton(
                          faIcon: FontAwesomeIcons.deleteLeft,
                          onClicked: () {
                            controller.btnBackspaceClicked();
                          },
                        ),
                      ],
                    ),
                    ContainerX(height: 4.0),
                    ButtonX(
                      title: 'Kirim Ulang',
                      titleColor: ColorX.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700,
                      backgroundColor: ColorX.transparent,
                      highlightColor: ColorX.theme.withOpacity(0.1),
                      width: 120.0,
                      height: 32.0,
                      cornerRadius: 8.0,
                      onClicked: () {
                        controller.btnResendClicked();
                      },
                    ),
                    ContainerX(
                        height: MediaQuery.of(Get.context!).padding.bottom)
                  ],
                ),
              ),
            ])));
  }
}
