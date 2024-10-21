import 'all_widgets.dart';

class ButtonX extends StatelessWidget {
  final IconData? faIcon;
  final String iconUrl;
  final double iconWidth;
  final double iconHeight;
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

  const ButtonX({
    Key? key,
    this.faIcon,
    this.iconUrl = '',
    this.iconWidth = 24.0,
    this.iconHeight = 24.0,
    this.faColor,
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
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.w700,
    this.enabled = true,
    this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.all(
          Radius.circular(cornerRadius),
        ),
        color: enabled == true ? backgroundColor : disabledBackgroundColor,
        child: InkWellX(
            highlightColor:
                enabled == true ? highlightColor : ColorX.transparent,
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
                  child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Visibility(
                      visible: (faIcon != null || iconUrl.isNotEmpty),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ImageX(
                            url: iconUrl,
                            faIcon: faIcon,
                            color: faColor,
                            width: iconWidth,
                            height: iconHeight,
                            fit: BoxFit.contain,
                          ),
                          ContainerX(width: title.isNotEmpty ? 4.0 : 0.0),
                        ],
                      )),
                  TextX(
                    title,
                    color: enabled == true ? titleColor : disabledTitleColor,
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    textAlign: TextAlign.start,
                    maxLines: 2048,
                  )
                ],
              )),
            )));
  }
}
