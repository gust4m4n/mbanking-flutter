import '../../widgets/all_widgets.dart';
import 'mbx_theme_cell.dart';
import 'mbx_theme_sheet_controller.dart';

// ignore: must_be_immutable
class MbxThemeSheet extends GetWidget<MbxThemeSheetController> {
  TextEditingController pinController = TextEditingController();

  Future<T?> show<T>() {
    FocusManager.instance.primaryFocus?.unfocus();
    return SheetX.showWithGrip(
        backgroundColor: ColorX.white,
        cornerRadius: 32.0,
        widget: this,
        title: 'Pilih Theme');
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxThemeSheetController>(
        init: MbxThemeSheetController(),
        builder: (controller) => ContainerX(
            backgroundColor: ColorX.white,
            topLeftRadius: 32.0,
            topRightRadius: 32.0,
            child: Wrap(children: [
              GridView.count(
                shrinkWrap: true,
                mainAxisSpacing: 0.0,
                crossAxisSpacing: 0.0,
                childAspectRatio: 1.0,
                crossAxisCount: 5,
                padding: EdgeInsets.all(12.0),
                physics: ClampingScrollPhysics(),
                children: [
                  MbxThemeCell(
                    color: Color(0xffd12f31),
                  ),
                  MbxThemeCell(
                    color: Color(0xffe81e63),
                  ),
                  MbxThemeCell(
                    color: Color(0xffff9800),
                  ),
                  MbxThemeCell(
                    color: Color(0xff009688),
                  ),
                  MbxThemeCell(
                    color: Color(0xff4caf50),
                  ),
                  MbxThemeCell(
                    color: Color(0xff8bc34a),
                  ),
                  MbxThemeCell(
                    color: Color(0xff3f51b5),
                  ),
                  MbxThemeCell(
                    color: Color(0xff2196f3),
                  ),
                  MbxThemeCell(
                    color: Color(0xff03a9f4),
                  ),
                  MbxThemeCell(
                    color: Color(0xff00bcd4),
                  ),
                  MbxThemeCell(
                    color: Color(0xff9c27b0),
                  ),
                  MbxThemeCell(
                    color: Color(0xff673ab7),
                  ),
                  MbxThemeCell(
                    color: Color(0xff7a5249),
                  ),
                  MbxThemeCell(
                    color: Color(0xff646d74),
                  ),
                  MbxThemeCell(
                    color: Color(0xff698b9b),
                  ),
                ],
              ),
              ContainerX(height: 12.0),
            ])));
  }
}
