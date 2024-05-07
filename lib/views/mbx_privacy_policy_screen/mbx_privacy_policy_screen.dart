import '../../widgets/all_widgets.dart';
import 'mbx_privacy_policy_controller.dart';

class MbxPrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxPrivacyPolicyController>(
        init: MbxPrivacyPolicyController(),
        builder: (controller) => MbxScreen(
                curvedBody: ContainerX(
              backgroundColor: ColorX.white,
              child: controller.privacyPolicyVM.loading
                  ? Center(
                      child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(ColorX.gray)),
                    )
                  : WebViewWidget(controller: controller.webController),
            )));
  }
}
