import '../../widgets/all_widgets.dart';
import 'demo_drawer_menu.dart';

class DemoDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0.0,
      child: Container(
        color: ColorX.white,
        child: Column(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: ColorX.blue,
                ),
                child: Row(
                  children: [
                    ImageX(
                      url:
                          'https://assets-prd.ignimgs.com/2023/04/27/transformers-rise-of-the-beast-new-button-1682603563738.jpg',
                      width: 80.0,
                      height: 80.0,
                      cornerRadius: 40.0,
                    ),
                    SizedBox(width: 16.0),
                    TextX(
                      'Header',
                      color: ColorX.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),
                  ],
                )),
            Expanded(
                child: Scrollbar(
                    child: SingleChildScrollView(
                        child: Column(
              children: [
                DemoDrawerMenu(
                    icon: FontAwesomeIcons.addressBook,
                    title: 'Menu 1',
                    onClicked: () {}),
                DemoDrawerMenu(
                    icon: FontAwesomeIcons.powerOff,
                    title: 'Menu 2',
                    onClicked: () {}),
              ],
            )))),
          ],
        ),
      ),
    );
  }
}
