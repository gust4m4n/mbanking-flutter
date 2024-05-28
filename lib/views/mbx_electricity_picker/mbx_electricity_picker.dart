import 'package:mbankingflutter/utils/all_utils.dart';

import '../../widgets/all_widgets.dart';
import '../mbx_home_page/mbx_launcher_cell.dart';
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
                  ContainerX(
                    backgroundColor: ColorX.theme,
                    cornerRadius: 12.0,
                    child: GridView.count(
                      shrinkWrap: true,
                      mainAxisSpacing: 0.0,
                      crossAxisSpacing: 0.0,
                      childAspectRatio: 1.02,
                      crossAxisCount: 3,
                      padding: EdgeInsets.all(12.0),
                      physics: ClampingScrollPhysics(),
                      children: [
                        MbxLauncherCell(
                            color: ColorX.yellow,
                            faIcon: FontAwesomeIcons.solidLightbulb,
                            title: 'Prabayar',
                            titleColor: ColorX.white,
                            highlightColor: ColorX.theme.lighten(0.1),
                            onClicked: () {
                              controller.btnPrepaidClicked();
                            }),
                        MbxLauncherCell(
                          color: ColorX.yellow,
                          faIcon: FontAwesomeIcons.solidLightbulb,
                          title: 'Pascabayar',
                          titleColor: ColorX.white,
                          highlightColor: ColorX.theme.lighten(0.1),
                          onClicked: () {
                            controller.btnPostpaidClicked();
                          },
                        ),
                        MbxLauncherCell(
                          color: ColorX.yellow,
                          faIcon: FontAwesomeIcons.solidLightbulb,
                          title: 'Non-Tagihan Listrik',
                          titleColor: ColorX.white,
                          highlightColor: ColorX.theme.lighten(0.1),
                          onClicked: () {
                            controller.btnNonTagLisClicked();
                          },
                        ),
                      ],
                    ),
                  ),
                  ContainerX(height: 16.0),
                  ButtonX(
                    title: 'Kembali',
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
