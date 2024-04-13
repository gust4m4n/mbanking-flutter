import '../../widgets/all_widgets.dart';
import 'mbx_pin_button.dart';
import 'mbx_pin_dot.dart';
import 'mbx_pin_sheet_controller.dart';

// ignore: must_be_immutable
class MbxPinSheet extends GetWidget<MbxPinSheetController> {
  final String title;
  final String description;
  final GestureTapCallback? onBiometricClicked;
  final Future<String> Function(String code) onSubmit;
  TextEditingController pinController = TextEditingController();

  MbxPinSheet({
    required this.title,
    required this.description,
    this.onBiometricClicked,
    required this.onSubmit,
  });

  static Future<T?> show<T>(
      {required String title,
      required String description,
      GestureTapCallback? onBiometricClicked,
      required Future<String> Function(String code) onSubmit}) {
    FocusManager.instance.primaryFocus?.unfocus();
    final sheet = MbxPinSheet(
        title: title,
        description: description,
        onBiometricClicked: onBiometricClicked,
        onSubmit: onSubmit);
    return SheetX.showWithGrip(
        backgroundColor: const Color.fromARGB(255, 130, 102, 102),
        cornerRadius: 16.0,
        widget: sheet,
        title: title);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxPinSheetController>(
        init: MbxPinSheetController(onSubmit: onSubmit),
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
                  MbxPinDot(on: controller.code.length >= 1),
                  ContainerX(width: 8.0),
                  MbxPinDot(on: controller.code.length >= 2),
                  ContainerX(width: 8.0),
                  MbxPinDot(on: controller.code.length >= 3),
                  ContainerX(width: 8.0),
                  MbxPinDot(on: controller.code.length >= 4),
                  ContainerX(width: 8.0),
                  MbxPinDot(on: controller.code.length >= 5),
                  ContainerX(width: 8.0),
                  MbxPinDot(on: controller.code.length >= 6),
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
                        MbxPinButton(
                          title: '1',
                          onClicked: () {
                            controller.btnKeypadClicked('1');
                          },
                        ),
                        ContainerX(width: 4.0),
                        MbxPinButton(
                          title: '2',
                          onClicked: () {
                            controller.btnKeypadClicked('2');
                          },
                        ),
                        ContainerX(width: 4.0),
                        MbxPinButton(
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
                        MbxPinButton(
                          title: '4',
                          onClicked: () {
                            controller.btnKeypadClicked('4');
                          },
                        ),
                        ContainerX(width: 4.0),
                        MbxPinButton(
                          title: '5',
                          onClicked: () {
                            controller.btnKeypadClicked('5');
                          },
                        ),
                        ContainerX(width: 4.0),
                        MbxPinButton(
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
                        MbxPinButton(
                          title: '7',
                          onClicked: () {
                            controller.btnKeypadClicked('7');
                          },
                        ),
                        ContainerX(width: 4.0),
                        MbxPinButton(
                          title: '8',
                          onClicked: () {
                            controller.btnKeypadClicked('8');
                          },
                        ),
                        ContainerX(width: 4.0),
                        MbxPinButton(
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
                        onBiometricClicked != null
                            ? MbxPinButton(
                                faIcon: FontAwesomeIcons.fingerprint,
                                onClicked: onBiometricClicked,
                              )
                            : MbxPinButton(
                                title: '',
                                onClicked: () {},
                              ),
                        ContainerX(width: 4.0),
                        MbxPinButton(
                          title: '0',
                          onClicked: () {
                            controller.btnKeypadClicked('0');
                          },
                        ),
                        ContainerX(width: 4.0),
                        MbxPinButton(
                          faIcon: FontAwesomeIcons.deleteLeft,
                          onClicked: () {
                            controller.btnBackspaceClicked();
                          },
                        ),
                      ],
                    ),
                    ContainerX(height: 4.0),
                    ButtonX(
                      title: 'Lupa PIN?',
                      titleColor: ColorX.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700,
                      backgroundColor: ColorX.transparent,
                      highlightColor: ColorX.theme.withOpacity(0.1),
                      width: 120.0,
                      height: 32.0,
                      cornerRadius: 8.0,
                      onClicked: () {
                        controller.btnForgotClicked();
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
