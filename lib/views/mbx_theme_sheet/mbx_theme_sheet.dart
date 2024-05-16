import '../../viewmodels/mbx_theme_vm.dart';
import '../../widgets/all_widgets.dart';
import 'mbx_theme_sheet_controller.dart';
import 'mbx_theme_widget.dart';

// ignore: must_be_immutable
class MbxThemeSheet extends GetWidget<MbxThemeSheetController> {
  Future<T?> show<T>() {
    FocusManager.instance.primaryFocus?.unfocus();
    return SheetX.showCustom(widget: this, title: 'Pilih Theme');
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxThemeSheetController>(
        init: MbxThemeSheetController(),
        builder: (controller) => ContainerX(
                child: Wrap(children: [
              GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(
                    left: 12.0, top: 0.0, right: 12.0, bottom: 12.0),
                physics: ClampingScrollPhysics(),
                itemCount: MbxThemeVM.colors.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 0.0,
                  crossAxisSpacing: 0.0,
                  childAspectRatio: 1.0,
                  crossAxisCount: 5,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return MbxThemeWidget(
                    color: MbxThemeVM.colors[index],
                  );
                },
              ),
            ])));
  }
}
