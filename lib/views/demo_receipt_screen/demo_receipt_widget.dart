import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class DemoReceiptWidget extends StatelessWidget {
  final String k;
  final String v;
  DemoReceiptWidget({required this.k, required this.v});

  @override
  Widget build(BuildContext context) {
    if (k == '-') {
      return ContainerX(
        backgroundColor: ColorX.lightGray,
        height: 1.0,
      );
    } else {
      return Row(children: [
        Expanded(
            child: TextX(
          k,
          color: ColorX.black,
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.start,
          maxLines: 2048,
        )),
        SizedBox(width: 24.0),
        Expanded(
            child: TextX(
          v,
          color: ColorX.black,
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
          textAlign: TextAlign.end,
          maxLines: 2048,
        )),
      ]);
    }
  }
}
