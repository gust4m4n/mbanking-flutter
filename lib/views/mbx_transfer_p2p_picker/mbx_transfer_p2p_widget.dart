import '../../models/mbx_transfer_p2p_dest_model.dart';
import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxTransferP2PPickerWidget extends StatelessWidget {
  final MbxTransferP2PDestModel dest;
  final GestureTapCallback? onDeleteClicked;

  MbxTransferP2PPickerWidget(
      {required this.dest, required this.onDeleteClicked});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0, bottom: 8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextX(
                    dest.name,
                    color: ColorX.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.start,
                    maxLines: 8,
                  ),
                  ContainerX(height: 2.0),
                  TextX(
                    dest.account,
                    color: ColorX.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.start,
                    maxLines: 8,
                  ),
                ],
              ),
            ),
            ContainerX(width: 8.0),
            ButtonX(
                faIcon: FontAwesomeIcons.trashCan,
                faWidth: 20.0,
                faHeight: 16.0,
                width: 38.0,
                height: 38.0,
                backgroundColor: ColorX.transparent,
                onClicked: onDeleteClicked)
          ],
        ));
  }
}