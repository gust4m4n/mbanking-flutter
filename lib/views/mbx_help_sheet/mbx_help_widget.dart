import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxHelpWidget extends StatelessWidget {
  final IconData faIcon;
  final String title;
  final GestureTapCallback? onClicked;

  MbxHelpWidget({required this.faIcon, required this.title, this.onClicked});

  @override
  Widget build(BuildContext context) {
    return InkWellX(
        highlightColor: onClicked != null
            ? ColorX.theme.withOpacity(0.1)
            : ColorX.transparent,
        cornerRadius: onClicked != null ? 12.0 : 0.0,
        onClicked: onClicked,
        child: ContainerX(
            backgroundColor: ColorX.transparent,
            borderWidth: 1.0,
            borderColor: ColorX.lightGray,
            cornerRadius: 12.0,
            padding: EdgeInsets.only(
                left: 12.0, top: 12.0, right: 12.0, bottom: 12.0),
            child: Row(
              children: [
                ImageX(
                  faIcon: faIcon,
                  color: ColorX.theme,
                  width: 32.0,
                  height: 32.0,
                ),
                SizedBox(width: 12.0),
                TextX(
                  title,
                  color: ColorX.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.start,
                ),
              ],
            )));
  }
}
