import 'all_widgets.dart';

class ButtonX extends StatelessWidget {
  final IconData? faIcon;
  final double faWidth;
  final double faHeight;
  final Color? faColor;
  final String title;
  final Color backgroundColor;
  final Color disabledBackgroundColor;
  final Color titleColor;
  final Color disabledTitleColor;
  final double cornerRadius;
  final double borderWidth;
  final Color borderColor;
  final Color? highlightColor;
  final double width;
  final double height;
  final double horizontalPadding;
  final double fontSize;
  final FontWeight fontWeight;
  final bool enabled;
  final GestureTapCallback? onClicked;

  ButtonX({
    Key? key,
    this.faIcon = null,
    this.faWidth = 24.0,
    this.faHeight = 24.0,
    this.faColor = null,
    this.title = 'Button',
    this.backgroundColor = ColorX.blue,
    this.disabledBackgroundColor = ColorX.lightGray,
    this.titleColor = ColorX.white,
    this.disabledTitleColor = ColorX.gray,
    this.cornerRadius = 8.0,
    this.borderWidth = 0.0,
    this.borderColor = ColorX.transparent,
    this.highlightColor,
    this.width = double.infinity,
    this.height = 48.0,
    this.horizontalPadding = 8.0,
    this.fontSize = 17.0,
    this.fontWeight = FontWeight.w600,
    this.enabled = true,
    this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.all(
          Radius.circular(cornerRadius),
        ),
        color: enabled == true ? backgroundColor : disabledBackgroundColor,
        child: InkWellX(
            highlightColor: highlightColor,
            onClicked: enabled == true ? onClicked : null,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                border: Border.all(
                    width: borderWidth,
                    color: enabled == true ? borderColor : ColorX.transparent),
                borderRadius: BorderRadius.all(
                  Radius.circular(cornerRadius),
                ),
              ),
              child: Center(
                  child: faIcon != null
                      ? ImageX(
                          faIcon: faIcon,
                          color: faColor,
                          width: faWidth,
                          height: faHeight)
                      : TextX(
                          title,
                          color:
                              enabled == true ? titleColor : disabledTitleColor,
                          fontSize: fontSize,
                          fontWeight: fontWeight,
                          textAlign: TextAlign.start,
                          maxLines: 2048,
                        )),
            )));
  }
}
