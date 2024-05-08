import 'all_widgets.dart';

class ContainerError extends StatelessWidget {
  final Widget? child;
  final String? error;
  final CrossAxisAlignment align;
  final TextAlign? textAlign;

  const ContainerError(
      {Key? key,
      this.child,
      this.error,
      this.align = CrossAxisAlignment.start,
      this.textAlign = TextAlign.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (child != null) child!,
      ContainerX(height: 4.0),
      Visibility(
          visible: error != null && error!.isNotEmpty,
          child: Column(crossAxisAlignment: align, children: [
            ContainerX(height: 4.0),
            TextX(
              error != null ? error! : '',
              color: ColorX.red,
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
              textAlign: textAlign,
              maxLines: 16,
            ),
          ]))
    ]);
  }
}
