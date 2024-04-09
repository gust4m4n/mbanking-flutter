import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxThemeButton extends StatelessWidget {
  final GestureTapCallback? onClicked;
  MbxThemeButton({required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return InkWellX(
      cornerRadius: 8.0,
      onClicked: onClicked,
      child: ContainerX(
        width: 42.0,
        height: 42.0,
        cornerRadius: 12.0,
        child: Center(
            child: ContainerX(
          backgroundColor: ColorX.theme,
          width: 32.0,
          height: 32.0,
          cornerRadius: 16.0,
          borderWidth: 4.0,
          borderColor: ColorX.white,
        )),
      ),
    );
  }
}
