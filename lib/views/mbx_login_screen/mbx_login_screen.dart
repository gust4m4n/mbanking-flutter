import "dart:math" show pi;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:mbankingflutter/views/mbx_login_screen/mbx_onboarding_cell.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widgets/all_widgets.dart';
import '../mbx_home_page/mbx_theme_button.dart';
import 'mbx_login_controller.dart';

class MbxLoginScreen extends StatelessWidget {
  MbxLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbLoginController>(
        init: MbLoginController(),
        builder: (controller) => ScreenX(
            lightStatusBar: false,
            topPadding: false,
            bottomPadding: true,
            bodyView: Column(children: [
              ContainerX(
                backgroundColor: ColorX.white,
                padding: EdgeInsets.only(
                    left: 24.0,
                    top: MediaQuery.of(Get.context!).padding.top + 12.0,
                    right: 24.0,
                    bottom: 0.0),
                child: Row(
                  children: [
                    Spacer(),
                    MbxThemeButton(
                      onClicked: () {
                        controller.btnThemeClicked();
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: ContainerX(
                backgroundColor: ColorX.white,
                width: double.infinity,
                child: ContainerX(
                  //backgroundColor: ColorX.red,
                  width: double.infinity,
                  child: controller.onboardingVM.list.length > 0
                      ? CarouselSlider.builder(
                          options: CarouselOptions(
                            scrollPhysics: ClampingScrollPhysics(),
                            padEnds: false,
                            autoPlay: true,
                            viewportFraction: 1.0,
                            height: double.infinity,
                            onPageChanged: (index, reason) {
                              controller.setOnboardingIndex(index);
                            },
                          ),
                          itemCount: controller.onboardingVM.list.length,
                          itemBuilder: (BuildContext context, int index,
                              int pageViewIndex) {
                            return MbxOnboardingCell(
                                controller.onboardingVM.list[index]);
                          })
                      : Container(),
                ),
              )),
              ContainerX(
                  backgroundColor: ColorX.white,
                  child: Column(
                    children: [
                      ContainerX(height: 12.0),
                      ContainerX(
                        padding: const EdgeInsets.only(
                            left: 24.0, top: 4.0, right: 24.0, bottom: 4.0),
                        height: 20.0,
                        child: Visibility(
                            visible: controller.onboardingVM.list.length > 0,
                            child: AnimatedSmoothIndicator(
                              activeIndex: controller.onboardingIndex,
                              count: controller.onboardingVM.list.length,
                              effect: SlideEffect(
                                dotHeight: 8,
                                dotWidth: 8,
                                dotColor: ColorX.theme.withOpacity(0.2),
                                activeDotColor: ColorX.theme,
                              ),
                            )),
                      ),
                      ContainerX(
                        padding: const EdgeInsets.only(
                            left: 24.0, top: 16.0, right: 24.0, bottom: 16.0),
                        child: TextFieldX(
                          hint: 'No. HP (08xxxxxxxxx)',
                          obscureText: false,
                          keyboardType: TextInputType.phone,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          readOnly: false,
                          controller: controller.txtPhoneController,
                          focusNode: controller.txtPhoneNode,
                          onChanged: (value) {
                            controller.txtPhoneOnChanged(value);
                          },
                          rightIcon: ImageX(
                            faIcon: FontAwesomeIcons.arrowRight,
                            color: ColorX.white,
                            width: 14.0,
                            height: 14.0,
                            backgroundColor: ColorX.theme,
                          ),
                          rightAction: () {
                            controller.btnLoginClicked();
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: TextX(
                          controller.version,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500,
                          color: ColorX.black,
                        ),
                      ),
                    ],
                  ))
            ])));
  }
}

class CurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // I've taken approximate height of curved part of view
    // Change it if you have exact spec for it
    final roundingHeight = size.height * 1.0 / 10.0;

    // this is top part of path, rectangle without any rounding
    final filledRectangle =
        Rect.fromLTRB(0, 0, size.width, size.height - roundingHeight);

    // this is rectangle that will be used to draw arc
    // arc is drawn from center of this rectangle, so it's height has to be twice roundingHeight
    // also I made it to go 5 units out of screen on left and right, so curve will have some incline there
    final roundingRectangle = Rect.fromLTRB(
        -5, size.height - roundingHeight * 2, size.width + 5, size.height);

    final path = Path();
    path.addRect(filledRectangle);

    // so as I wrote before: arc is drawn from center of roundingRectangle
    // 2nd and 3rd arguments are angles from center to arc start and end points
    // 4th argument is set to true to move path to rectangle center, so we don't have to move it manually
    path.arcTo(roundingRectangle, pi, -pi, true);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // returning fixed 'true' value here for simplicity, it's not the part of actual question, please read docs if you want to dig into it
    // basically that means that clipping will be redrawn on any changes
    return true;
  }
}
