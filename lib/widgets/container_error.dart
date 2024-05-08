import 'all_widgets.dart';

class ContainerError extends StatelessWidget {
  final Widget? child;
  final String? error;
  final CrossAxisAlignment alignment;

  const ContainerError(
      {Key? key,
      this.child,
      this.error,
      this.alignment = CrossAxisAlignment.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (child != null) child!,
      ContainerX(height: 4.0),
      Visibility(
          visible: error != null && error!.isNotEmpty,
          child: Column(crossAxisAlignment: alignment, children: [
            ContainerX(height: 4.0),
            TextX(
              error != null ? error! : '',
              color: ColorX.red,
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
              maxLines: 16,
            ),
          ]))
    ]);
  }
}
