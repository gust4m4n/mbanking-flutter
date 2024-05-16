import '../../widgets/all_widgets.dart';
import 'mbx_electricity_controller.dart';

// ignore: must_be_immutable
class MbxElectricityPicker extends GetWidget<MbxElectricityController> {
  Future<T?> show<T>() {
    FocusManager.instance.primaryFocus?.unfocus();
    return SheetX.showCustom(widget: this, title: 'Listrik PLN');
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxElectricityController>(
        init: MbxElectricityController(),
        builder: (controller) => ContainerX(
                child: Wrap(children: [
              ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(
                    left: 16.0, top: 0.0, right: 16.0, bottom: 16.0),
                physics: ClampingScrollPhysics(),
                children: [
                  ButtonX(
                    title: 'Token Listrik',
                    titleColor: ColorX.black,
                    backgroundColor: ColorX.theme.withOpacity(0.1),
                    highlightColor: ColorX.theme.withOpacity(0.1),
                    onClicked: () {
                      controller.btnElectricityTokenClicked();
                    },
                  ),
                  ContainerX(height: 4.0),
                  ButtonX(
                    title: 'Pascabayar',
                    titleColor: ColorX.black,
                    backgroundColor: ColorX.theme.withOpacity(0.1),
                    highlightColor: ColorX.theme.withOpacity(0.1),
                    onClicked: () {},
                  ),
                  ContainerX(height: 4.0),
                  ButtonX(
                    title: 'Non-Tagihan Listrik',
                    titleColor: ColorX.black,
                    backgroundColor: ColorX.theme.withOpacity(0.1),
                    highlightColor: ColorX.theme.withOpacity(0.1),
                    onClicked: () {},
                  ),
                  ContainerX(height: 16.0),
                  ButtonX(
                    title: 'Batal',
                    titleColor: ColorX.black,
                    backgroundColor: ColorX.transparent,
                    borderWidth: 1.0,
                    borderColor: ColorX.gray,
                    onClicked: () {
                      controller.btnCloseClicked();
                    },
                  ),
                ],
              ),
            ])));
  }
}
