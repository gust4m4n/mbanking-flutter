import '../../models/mbx_transfer_p2p_dest_model.dart';
import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxTransferP2PDestCell extends StatelessWidget {
  final MbxTransferP2PDestModel dest;
  MbxTransferP2PDestCell(this.dest);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(left: 12.0, top: 8.0, right: 12.0, bottom: 8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextX(
                    dest.name,
                    color: ColorX.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.start,
                    maxLines: 3,
                  ),
                  SizedBox(height: 2.0),
                  TextX(
                    dest.account,
                    color: ColorX.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.start,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
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
