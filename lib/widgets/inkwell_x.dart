import 'all_widgets.dart';

class InkWellX extends StatelessWidget {
  final Color? backgroundColor;
  final Color? highlightColor;
  final double cornerRadius;
  final GestureTapCallback? onClicked;
  final Widget? child;

  const InkWellX({
    Key? key,
    this.backgroundColor,
    this.highlightColor,
    this.cornerRadius = 0.0,
    this.onClicked,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: ColorX.transparent,
        child: InkWell(
            splashFactory: NoSplash.splashFactory,
            customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(cornerRadius)),
            highlightColor: highlightColor,
            onTap: () {
              if (onClicked != null) {
                onClicked!();
              }
            },
            child: child));
  }
}
