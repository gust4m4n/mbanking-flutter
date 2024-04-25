import 'package:mbankingflutter/models/mbx_confirm_model.dart';

import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxConfirmWidget extends StatelessWidget {
  final MbxConfirmModel dest;
  final GestureTapCallback? onDeleteClicked;

  MbxConfirmWidget({required this.dest, required this.onDeleteClicked});

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
                    dest.label,
                    color: ColorX.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.start,
                    maxLines: 8,
                  ),
                  ContainerX(height: 2.0),
                  TextX(
                    dest.value,
                    color: ColorX.black,
                    fontSize: 15.0,
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
