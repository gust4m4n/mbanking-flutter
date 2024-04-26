import '../../models/mbx_label_value_model.dart';
import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxInquiryWidget extends StatelessWidget {
  final MbxLabelValueModel dest;
  final GestureTapCallback? onDeleteClicked;

  MbxInquiryWidget({required this.dest, required this.onDeleteClicked});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(left: 16.0, top: 4.0, right: 16.0, bottom: 4.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextX(
                    dest.label,
                    color: ColorX.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.start,
                    maxLines: 8,
                  ),
                  ContainerX(height: 2.0),
                  TextX(
                    dest.value,
                    color: ColorX.black,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.start,
                    maxLines: 8,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}