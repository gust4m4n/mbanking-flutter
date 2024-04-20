import '../../widgets/all_widgets.dart';
import 'mbx_privacy_policy_controller.dart';

class MbxPrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxPrivacyPolicyController>(
        init: MbxPrivacyPolicyController(),
        builder: (controller) => ScreenX(
            lightStatusBar: true,
            headerView: NavigationBarX(
              title: '',
              leftBtn: ImageX(
                faIcon: FontAwesomeIcons.arrowLeft,
                width: 20.0,
                height: 20.0,
                color: ColorX.white,
                fit: BoxFit.contain,
              ),
              leftAction: () {
                controller.btnBackClicked();
              },
            ),
            bottomPadding: false,
            bodyView: Column(
              children: [
                TopContainerX(),
                Expanded(
                    child: ContainerX(
                  backgroundColor: ColorX.white,
                  child: controller.privacyPolicyVM.loading
                      ? Center(
                          child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(ColorX.gray)),
                        )
                      : WebViewWidget(controller: controller.webController),
                ))
              ],
            )));
  }
}
