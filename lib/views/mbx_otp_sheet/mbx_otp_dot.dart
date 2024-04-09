import '../../widgets/all_widgets.dart';

class MbxOtpDot extends StatelessWidget {
  final String number;

  MbxOtpDot({
    Key? key,
    this.number = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerX(
      backgroundColor: ColorX.transparent,
      width: 32.0,
      height: 32.0,
      cornerRadius: 8.0,
      borderWidth: 1.0,
      borderColor: ColorX.gray,
      child: Center(
          child: TextX(
        number,
        fontSize: 17.0,
        fontWeight: FontWeight.w700,
      )),
    );
  }
}
