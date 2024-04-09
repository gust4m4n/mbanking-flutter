import 'package:mbankingflutter/utils/all_utils.dart';
import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxButtonNavBarButton extends StatelessWidget {
  static final buttonWidth =
      (MediaQuery.of(Get.context!).size.width - 24.0) / 5.0;

  final String title;
  final IconData faIcon;
  final bool selected;
  final GestureTapCallback? onClicked;

  MbxButtonNavBarButton({
    required this.title,
    required this.faIcon,
    required this.selected,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return ContainerX(
      backgroundColor:
          selected ? ColorX.theme.lighten(0.35) : ColorX.theme.lighten(0.45),
      child: InkWellX(
          highlightColor: ColorX.theme.lighten(0.40),
          onClicked: () {
            onClicked!();
          },
          child: ContainerX(
              width: buttonWidth,
              child: Center(
                child: Wrap(
                  direction: Axis.vertical,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    ImageX(
                      faIcon: faIcon,
                      height: 20.0,
                      width: 20.0,
                      color: selected ? ColorX.black : ColorX.gray,
                    ),
                    SizedBox(height: 2.0),
                    TextX(
                      title,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                      color: selected ? ColorX.black : ColorX.gray,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ))),
    );
  }
}
