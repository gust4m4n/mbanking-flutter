import 'package:mbankingflutter/viewmodels/mbx_theme_vm.dart';

import '../../widgets/all_widgets.dart';
import 'mbx_theme_cell.dart';
import 'mbx_theme_sheet_controller.dart';

// ignore: must_be_immutable
class MbxThemeSheet extends GetWidget<MbxThemeSheetController> {
  TextEditingController pinController = TextEditingController();

  Future<T?> show<T>() {
    FocusManager.instance.primaryFocus?.unfocus();
    return SheetX.showWithGrip(
        //backgroundColor: ColorX.white,
        //cornerRadius: 32.0,
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
              GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(12.0),
                physics: ClampingScrollPhysics(),
                itemCount: MbxThemeVM.colors.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 0.0,
                  crossAxisSpacing: 0.0,
                  childAspectRatio: 1.0,
                  crossAxisCount: 5,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return MbxThemeCell(
                    color: MbxThemeVM.colors[index],
                  );
                },
              ),
              ContainerX(height: MediaQuery.of(Get.context!).padding.bottom)
            ])));
  }
}
