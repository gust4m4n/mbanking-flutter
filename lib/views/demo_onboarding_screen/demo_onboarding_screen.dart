import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../viewmodels/mbx_format_vm.dart';
import '../../widgets/all_widgets.dart';
import 'demo_onboarding_controller.dart';

class DemoOnboardingScreen extends StatelessWidget {
  DemoOnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoOnboardingController>(
        init: DemoOnboardingController(),
        builder: (controller) => ScreenX(
            lightStatusBar: false,
            topPadding: false,
            bottomPadding: true,
            bodyView: Column(
              children: [
                Expanded(
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: controller.pageController,
                    children: controller.movieListVM.list
                        .map((movie) => Column(
                              children: [
                                Expanded(
                                  child: ImageX(
                                    url: movie.poster,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                ContainerX(
                                  width: double.infinity,
                                  height: 160.0,
                                  padding: const EdgeInsets.only(
                                      left: 24.0,
                                      top: 16.0,
                                      right: 24.0,
                                      bottom: 16.0),
                                  child: Center(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextX(
                                        movie.title,
                                        color: ColorX.black,
                                        fontSize: 32.0,
                                        fontWeight: FontWeight.w700,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                      ),
                                      const SizedBox(height: 8.0),
                                      TextX(
                                        MbxFormatVM.currencyUSD(
                                            value: movie.revenue),
                                        color: ColorX.black,
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w700,
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                      ),
                                    ],
                                  )),
                                ),
                              ],
                            ))
                        .toList(),
                  ),
                ),
                ContainerX(
                  padding: const EdgeInsets.only(
                      left: 24.0, top: 4.0, right: 24.0, bottom: 4.0),
                  height: 20.0,
                  child: Visibility(
                      visible: controller.movieListVM.list.length > 0,
                      child: SmoothPageIndicator(
                        controller: controller.pageController,
                        count: controller.movieListVM.list.length,
                        effect: SlideEffect(
                          dotHeight: 8,
                          dotWidth: 8,
                          dotColor: ColorX.gray.withOpacity(0.2),
                          activeDotColor: ColorX.gray,
                        ),
                      )),
                ),
                ContainerX(
                    padding: const EdgeInsets.only(
                        left: 16.0, top: 16.0, right: 16.0, bottom: 16.0),
                    child: ButtonX(
                      width: 100.0,
                      title: 'Next',
                      titleColor: ColorX.black,
                      backgroundColor: ColorX.transparent,
                      onClicked: () {
                        controller.btnBackClicked();
                      },
                    ))
              ],
            )));
  }
}
