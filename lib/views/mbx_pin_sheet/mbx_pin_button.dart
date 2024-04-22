import '../../widgets/all_widgets.dart';

class MbxPinButton extends StatelessWidget {
  final String title;
  final IconData? faIcon;

  final GestureTapCallback? onClicked;

  MbxPinButton({
    Key? key,
    this.title = '',
    this.faIcon = null,
    this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: (title.isNotEmpty || faIcon != null)
            ? ButtonX(
                height: 48.0,
                cornerRadius: 8.0,
                backgroundColor: ColorX.theme.withOpacity(0.1),
                highlightColor: ColorX.theme.withOpacity(0.2),
                titleColor: ColorX.black,
                title: title,
                faIcon: faIcon,
                faColor: ColorX.black,
                fontSize: 24.0,
                fontWeight: FontWeight.w400,
                onClicked: onClicked)
            : ContainerX(height: 48.0));
  }
}
