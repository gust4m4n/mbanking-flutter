import 'package:mbankingflutter/views/mbx_help_sheet/mbx_help_widget.dart';

import '../../widgets/all_widgets.dart';
import 'mbx_help_sheet_controller.dart';

// ignore: must_be_immutable
class MbxHelpSheet extends GetWidget<MbxHelpSheetController> {
  MbxHelpSheet();

  static Future<T?> show<T>() {
    FocusManager.instance.primaryFocus?.unfocus();
    final sheet = MbxHelpSheet();
    return SheetX.showCustom(
      widget: sheet,
      title: 'Pusat Bantuan',
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxHelpSheetController>(
        init: MbxHelpSheetController(),
        builder: (controller) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  physics: ClampingScrollPhysics(),
                  children: [
                    MbxHelpWidget(
                      faIcon: FontAwesomeIcons.headset,
                      title: 'Call Center',
                      onClicked: () {
                        Get.back();
                        //
                      },
                    ),
                    SizedBox(height: 8.0),
                    MbxHelpWidget(
                      faIcon: FontAwesomeIcons.commentSms,
                      title: 'SMS',
                      onClicked: () {
                        Get.back();
                        //
                      },
                    ),
                    SizedBox(height: 8.0),
                    MbxHelpWidget(
                      faIcon: FontAwesomeIcons.whatsapp,
                      title: 'WhatsApp',
                      onClicked: () {
                        Get.back();
                        //
                      },
                    )
                  ],
                ),
                ContainerX(height: 16.0),
                ContainerX(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ButtonX(
                        title: 'Tutup',
                        backgroundColor: ColorX.theme,
                        onClicked: () {
                          Get.back();
                        })),
                ContainerX(height: 16.0),
              ],
            ));
  }
}
