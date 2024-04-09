import 'package:carousel_slider/carousel_slider.dart';
import '../../widgets/all_widgets.dart';
import '../demo_image_screen/demo_image_screen.dart';
import 'demo_carousel_controller.dart';

class DemoCarouselScreen extends StatelessWidget {
  DemoCarouselScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoCarouselController>(
      init: DemoCarouselController(),
      builder: (controller) => ScreenX(
        lightStatusBar: true,
        headerView: NavigationBarX(
          title: 'Carousel',
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
        bodyView: controller.movieListVM.list.length > 0
            ? CarouselSlider.builder(
              
                options: CarouselOptions(
                  
                  padEnds: false,
                  autoPlay: true,
                  viewportFraction: 0.85,
                  height: 180.0,
                  onPageChanged: (index, reason) {
                    controller.setPageIndex(index);
                  },
                ),
                itemCount: controller.movieListVM.list.length,
                itemBuilder:
                    (BuildContext context, int index, int pageViewIndex) {
                  final movie = controller.movieListVM.list[index];
                  return Material(
                      color: ColorX.transparent,
                      child: InkWell(
                          customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(.0)),
                          highlightColor: ColorX.highlight,
                          onTap: () {
                            Get.to(DemoImageScreen(url: movie.poster));
                          },
                          child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: ImageX(
                                url: movie.poster,
                                width: double.infinity,
                                height: double.infinity,
                                cornerRadius: 8.0,
                                fit: BoxFit.cover,
                              ))));
                })
            : Container(),
      ),
    );
  }
}
