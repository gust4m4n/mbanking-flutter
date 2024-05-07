import '../../widgets/all_widgets.dart';
import 'mbx_tnc_controller.dart';

class MbxTncScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxTncController>(
      init: MbxTncController(),
      builder: (controller) => MbxScreen(
          curvedBody: ContainerX(
        backgroundColor: ColorX.white,
        child: controller.tncVM.loading
            ? Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(ColorX.gray)),
              )
            : WebViewWidget(controller: controller.webController),
      )),
    );
  }
}
