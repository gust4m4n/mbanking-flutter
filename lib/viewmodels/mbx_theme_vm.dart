import '../views/mbx_bottom_navbar_screen/mbx_bottom_navbar_controller.dart';
import '../views/mbx_theme_sheet/mbx_theme_sheet.dart';
import '../widgets/all_widgets.dart';
import 'mbx_preferences_vm+users.dart';

class MbxThemeVM {
  static List<Color> colors = [
    Color(0xff673ab7),
    Color(0xff9c27b0),
    Color(0xff4CA735),
    Color(0xff2196f3),
    Color(0xff1877F2),
    Color(0xff3f51b5),
    Color(0xffE60023),
    Color(0xffe81e63),
    Color(0xffd12f31),
    Color(0xffff9800),
    Color(0xff7a5249),
    Color(0xff646d74),
  ];

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
