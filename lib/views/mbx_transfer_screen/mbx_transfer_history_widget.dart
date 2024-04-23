import '../../models/mbx_transfer_history_model.dart';
import '../../viewmodels/mbx_format_vm.dart';
import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxTransferHistoryWidget extends StatelessWidget {
  final MbxTransferHistoryModel history;
  MbxTransferHistoryWidget(this.history);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0, bottom: 8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextX(
                    history.name,
                    color: ColorX.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.start,
                    maxLines: 8,
                  ),
                  SizedBox(height: 2.0),
                  TextX(
                    '${history.bank} - ${history.account}',
                    color: ColorX.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.start,
                    maxLines: 8,
                  ),
                  SizedBox(height: 2.0),
                  Row(children: [
                    TextX(
                      MbxFormatVM.currencyRP(history.amount,
                          prefix: true, mutation: false, masked: false),
                      color: ColorX.green,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.start,
                      maxLines: 8,
                    ),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: TextX(
                        MbxFormatVM.longDateTime(history.date),
                        color: ColorX.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.start,
                        maxLines: 8,
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            ContainerX(width: 8.0),
            ImageX(
              faIcon: FontAwesomeIcons.chevronRight,
              width: 13.0,
              height: 13.0,
              color: ColorX.black,
              fit: BoxFit.contain,
            )
          ],
        ));
  }
}
