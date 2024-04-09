import 'package:get/get.dart';
import '../../viewmodels/demo_movie_list_vm.dart';

class DemoCarouselController extends GetxController {
  var movieListVM = DemoMovieListVM();
  var pageIndex = 0;

  @override
  void onReady() {
    super.onReady();
    movieListVM.nextPage().then((resp) {
      if (resp.status == 200) {
        update();
      }
    });
  }

  btnBackClicked() {
    Get.back();
  }

  setPageIndex(int index) {
    pageIndex = index;
  }
}
