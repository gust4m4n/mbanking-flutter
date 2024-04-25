import '../../models/mbx_label_value_model.dart';
import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxReceiptCell extends StatelessWidget {
  final MbxLabelValueModel detail;
  MbxReceiptCell(this.detail);

  @override
  Widget build(BuildContext context) {
    return detail.label == '-'
        ? Padding(
            padding:
                EdgeInsets.only(left: 0.0, top: 4.0, right: 0.0, bottom: 4.0),
            child: DashedDividerX(
                dashColor: ColorX.gray, dashWidth: 6.0, dashHeight: 1.0))
        : Padding(
            padding:
                EdgeInsets.only(left: 0.0, top: 4.0, right: 0.0, bottom: 4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextX(
                          detail.label,
                          color: ColorX.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.start,
                          maxLines: 8,
                        ),
                      ),
                      ContainerX(width: 16.0),
                      Expanded(
                          child: TextX(
                        detail.value,
                        color: ColorX.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.end,
                        maxLines: 8,
                      )),
                    ],
                  ),
                ),
              ],
            ));
  }
}
