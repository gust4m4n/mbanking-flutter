import 'all_widgets.dart';

class ContainerX extends StatelessWidget {
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final double borderWidth;
  final Color borderColor;
  final double cornerRadius;
  final double topLeftRadius;
  final double topRightRadius;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Clip clipBehavior;
  final Widget? child;

  const ContainerX({
    Key? key,
    this.backgroundColor = ColorX.transparent,
    this.width,
    this.height,
    this.borderWidth = 0.0,
    this.borderColor = ColorX.transparent,
    this.cornerRadius = 0.0,
    this.topLeftRadius = 0.0,
    this.topRightRadius = 0.0,
    this.padding = const EdgeInsets.all(0.0),
    this.margin = const EdgeInsets.all(0.0),
    this.clipBehavior = Clip.antiAlias,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      clipBehavior: clipBehavior,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                  topLeftRadius > 0.0 ? topLeftRadius : cornerRadius),
              topRight: Radius.circular(
                  topRightRadius > 0.0 ? topLeftRadius : cornerRadius),
              bottomLeft: Radius.circular(cornerRadius),
              bottomRight: Radius.circular(cornerRadius)),
          border: Border.all(
            width: borderWidth,
            color: borderWidth == 0.0
                ? backgroundColor ?? Colors.transparent
                : borderColor,
          )),
      child: child,
    );
  }
}
