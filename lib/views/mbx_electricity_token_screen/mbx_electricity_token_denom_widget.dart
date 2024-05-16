import 'package:mbankingflutter/viewmodels/mbx_format_vm.dart';

import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxElectricityTokenDenomWidget extends StatelessWidget {
  final int nominal;
  final bool selected;
  final GestureTapCallback? onClicked;

  MbxElectricityTokenDenomWidget(
      {required this.nominal, required this.selected, this.onClicked = null});

  @override
  Widget build(BuildContext context) {
    return InkWellX(
        highlightColor: ColorX.theme.withOpacity(0.1),
        cornerRadius: 8.0,
        onClicked: onClicked,
        child: ContainerX(
            backgroundColor: selected
                ? ColorX.theme.withOpacity(0.2)
                : ColorX.theme.withOpacity(0.1),
            cornerRadius: 8.0,
            borderWidth: selected ? 1.0 : 0.0,
            borderColor: selected ? ColorX.theme : ColorX.transparent,
            child: Center(
              child: TextX(
                MbxFormatVM.currencyRP(nominal,
                    prefix: false, mutation: false, masked: false),
                color: ColorX.black,
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            )));
  }
}
