import 'package:mbankingflutter/utils/all_utils.dart';

import '../../models/mbx_account_model.dart';
import '../../viewmodels/mbx_format_vm.dart';
import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxSofWidget extends StatelessWidget {
  final MbxAccountModel account;
  final bool borders;
  final GestureTapCallback? onEyeClicked;

  MbxSofWidget(
      {required this.account,
      required bool this.borders,
      required this.onEyeClicked});

  @override
  Widget build(BuildContext context) {
    return ContainerX(
        backgroundColor: ColorX.transparent,
        borderWidth: 1.0,
        borderColor: borders ? ColorX.lightGray : ColorX.transparent,
        cornerRadius: borders ? 12.0 : 0.0,
        padding: borders
            ? EdgeInsets.only(left: 12.0, top: 8.0, right: 12.0, bottom: 8.0)
            : EdgeInsets.zero,
        child: Row(
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ContainerX(
                    backgroundColor: ColorX.theme.darken(0.03),
                    padding: EdgeInsets.only(
                        left: 8.0, top: 2.0, right: 8.0, bottom: 2.0),
                    cornerRadius: 6.0,
                    child: TextX(
                      account.name,
                      color: ColorX.white,
                      fontSize: 11.0,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  TextX(
                    account.account,
                    color: ColorX.black,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.start,
                  ),
                  TextX(
                    MbxFormatVM.currencyRP(account.balance,
                        prefix: true,
                        mutation: false,
                        masked: !account.visible),
                    color: ColorX.black,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.start,
                  ),
                ]),
            Spacer(),
            ButtonX(
              faIcon: account.visible
                  ? FontAwesomeIcons.eyeSlash
                  : FontAwesomeIcons.eye,
              faWidth: 24.0,
              faHeight: 20.0,
              width: 50.0,
              height: 50.0,
              backgroundColor: ColorX.transparent,
              onClicked: onEyeClicked,
            )
          ],
        ));
  }
}
