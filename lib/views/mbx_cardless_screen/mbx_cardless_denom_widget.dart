import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxCardlessDenomWidget extends StatelessWidget {
  final String title;
  final GestureTapCallback? onClicked;

  MbxCardlessDenomWidget({required this.title, this.onClicked = null});

  @override
  Widget build(BuildContext context) {
    return InkWellX(
        highlightColor: ColorX.theme.withOpacity(0.1),
        cornerRadius: 12.0,
        onClicked: onClicked,
        child: ContainerX(
            borderWidth: 1.0,
            borderColor: ColorX.lightGray,
            cornerRadius: 12.0,
            child: Center(
              child: TextX(
                title,
                color: ColorX.black,
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            )));
  }
}
