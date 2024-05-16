import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxElectricityWidget extends StatelessWidget {
  final String title;

  MbxElectricityWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return ContainerX(
        borderWidth: 1.0,
        borderColor: ColorX.lightGray,
        cornerRadius: 12.0,
        padding:
            EdgeInsets.only(left: 12.0, top: 8.0, right: 12.0, bottom: 8.0),
        child: Center(
            child: InkWellX(
                cornerRadius: 29.0,
                highlightColor: ColorX.highlight,
                onClicked: () {
                  //final hex = '#${color.value.toRadixString(16)}';
                  // /Get.back(result: hex);
                },
                child: ContainerX(
                    padding: EdgeInsets.all(4.0),
                    child: TextX(title,
                        color: ColorX.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center,
                        maxLines: 1)))));
  }
}
