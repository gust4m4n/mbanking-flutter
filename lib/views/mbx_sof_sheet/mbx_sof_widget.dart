import '../../models/mbx_account_model.dart';
import '../../viewmodels/mbx_format_vm.dart';
import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxSofWidget extends StatelessWidget {
  final MbxAccountModel account;
  final bool borders;
  final GestureTapCallback? onClicked;

  MbxSofWidget(
      {required this.account,
      required bool this.borders,
      required this.onClicked});

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
                  TextX(
                    account.name,
                    color: ColorX.black,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.start,
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
            ImageX(
              faIcon: account.visible
                  ? FontAwesomeIcons.eyeSlash
                  : FontAwesomeIcons.eye,
              width: 32.0,
              height: 20.0,
            )
          ],
        ));
  }
}
