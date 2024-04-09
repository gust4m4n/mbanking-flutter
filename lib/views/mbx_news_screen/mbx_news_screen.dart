import '../../models/mbx_news_model.dart';
import '../../widgets/all_widgets.dart';
import 'mbx_news_controller.dart';

class MbxNewsScreen extends StatelessWidget {
  final MbxNewsModel news;

  MbxNewsScreen({required this.news});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxNewsController>(
        init: MbxNewsController(news),
        builder: (controller) => ScreenX(
              lightStatusBar: true,
              bottomPadding: false,
              bodyView: ContainerX(
                  backgroundColor: ColorX.white,
                  child: Stack(children: [
                    ImageX(
                      url: news.image,
                      width: MediaQuery.of(Get.context!).size.width,
                      height: MediaQuery.of(Get.context!).size.width *
                          MbxNewsModel.imageAspectRatio,
                    ),
                    Positioned(
                      left: MediaQuery.of(Get.context!).padding.left + 12.0,
                      top: MediaQuery.of(Get.context!).padding.top + 12.0,
                      child: ButtonX(
                        backgroundColor: ColorX.theme.withOpacity(0.5),
                        width: 40.0,
                        height: 40.0,
                        cornerRadius: 20.0,
                        faIcon: FontAwesomeIcons.arrowLeft,
                        faWidth: 18.0,
                        faHeight: 18.0,
                        faColor: ColorX.white,
                        onClicked: () {
                          controller.btnBackClicked();
                        },
                      ),
                    ),
                    Positioned(
                        left: 0.0,
                        top: (MediaQuery.of(Get.context!).size.width *
                                MbxNewsModel.imageAspectRatio) -
                            16.0,
                        right: 0.0,
                        bottom: 0.0,
                        child: ContainerX(
                            padding: EdgeInsets.only(top: 16.0),
                            backgroundColor: ColorX.white,
                            topLeftRadius: 16.0,
                            topRightRadius: 16.0,
                            child: WebViewWidget(
                                controller: controller.webController)))
                  ])),
            ));
  }
}
