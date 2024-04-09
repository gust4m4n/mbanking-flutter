import '../../viewmodels/demo_movie_list_vm.dart';
import '../../widgets/all_widgets.dart';

class DemoSearchPickerController extends GetxController {
  TextEditingController txtSearch = TextEditingController();
  var movieListVM = DemoMovieListVM();

  @override
  void onReady() {
    super.onReady();
    update();
    movieListVM.nextPage().then((resp) {
      movieListVM.sort();
      movieListVM.setFilter('');
      update();
    });
  }

  btnCloseClicked() {
    Get.back(result: null);
  }

  txtSearchChanged(String value) {
    movieListVM.setFilter(value);
    update();
  }
}
