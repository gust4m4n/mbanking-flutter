import '../views/mbx_bottom_navbar_screen/mbx_bottom_navbar_controller.dart';
import '../views/mbx_theme_sheet/mbx_theme_sheet.dart';
import '../widgets/all_widgets.dart';
import 'mbx_preferences_vm+users.dart';

class MbxThemeVM {
  static Future<T?> change<T>() async {
    final sheet = MbxThemeSheet();
    final value = await sheet.show();
    try {
      await MbxUserPreferencesVM.setTheme(value);
      ColorX.theme = hexToColor(value);
      final controller = Get.find<MbxBottomNavBarController>();
      controller.update();
    } catch (e) {}
    return value;
  }
}
