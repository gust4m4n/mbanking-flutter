import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxLauncherWidget extends StatelessWidget {
  final Color color;
  final IconData faIcon;
  final String title;
  final Color titleColor;
  final Color highlightColor;
  final GestureTapCallback? onClicked;

  MbxLauncherWidget(
      {required this.color,
      required this.faIcon,
      required this.title,
      required this.titleColor,
      required this.highlightColor,
      this.onClicked = null});

  @override
  Widget build(BuildContext context) {
    return InkWellX(
        highlightColor: highlightColor,
        cornerRadius: 12.0,
        onClicked: onClicked,
        child: ContainerX(
            child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ImageX(
                        faIcon: faIcon,
                        fit: BoxFit.contain,
                        width: 40.0,
                        height: 40.0,
                        cornerRadius: 28.0,
                        padding: EdgeInsets.all(10.0),
                        backgroundColor: color,
                        color: ColorX.white),
                    SizedBox(
                      height: 4.0,
                    ),
                    TextX(
                      title,
                      color: titleColor,
                      fontSize: 11.0,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                    Spacer()
                  ],
                ))));
  }
}
