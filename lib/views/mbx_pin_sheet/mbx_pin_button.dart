import 'package:mbankingflutter/utils/all_utils.dart';

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
                backgroundColor: ColorX.theme.lighten(0.4),
                highlightColor: ColorX.theme.lighten(0.3),
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
