import '../../models/mbx_transfer_p2p_dest_model.dart';
import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxStringPickerWidget extends StatelessWidget {
  final MbxTransferP2PDestModel dest;
  final GestureTapCallback? onDeleteClicked;

  MbxStringPickerWidget({required this.dest, required this.onDeleteClicked});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0, bottom: 8.0),
      child: TextX(
        dest.name,
        color: ColorX.black,
        fontSize: 15.0,
        fontWeight: FontWeight.w400,
        textAlign: TextAlign.start,
        maxLines: 8,
      ),
    );
  }
}
