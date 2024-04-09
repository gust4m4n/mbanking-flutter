import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class DemoDrawerMenu extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function()? onClicked;
  DemoDrawerMenu(
      {required this.icon, required this.title, required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: ColorX.transparent,
        child: InkWell(
          highlightColor: ColorX.highlight,
          onTap: onClicked,
          child: Padding(
            padding: EdgeInsets.only(
                left: 16.0, top: 12.0, right: 16.0, bottom: 12.0),
            child: Row(
              children: [
                ImageX(
                  faIcon: icon,
                  width: 24.0,
                  height: 24.0,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 8.0),
                TextX(
                  title,
                  color: ColorX.black,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ));
  }
}
