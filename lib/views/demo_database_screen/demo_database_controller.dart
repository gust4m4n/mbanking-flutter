import 'package:get/get.dart';
import '../../models/demo_movie_model.dart';
import '../../viewmodels/demo_database_vm.dart';

class DemoDatabaseController extends GetxController {
  var loading = false;
  List<int> row_ids = [];

  @override
  Future<void> onReady() async {
    super.onReady();
    loading = true;
    update();
    await DemoDatabaseVM.demo();

    await DemoDatabaseVM.db.beginTransaction();
    await DemoDatabaseVM.db.movieDeleteAll();
    for (var i = 0; i < 2000; i++) {
      final movie = DemoMovieModel();
      movie.movie_id = i + 1;
      movie.poster =
          'https://assets-prd.ignimgs.com/2023/04/27/transformers-rise-of-the-beast-new-button-1682603563738.jpg';
      movie.title = 'Transformers: Rise of the Beasts';
      movie.revenue = 100000000000;
      await DemoDatabaseVM.db.movieInsert(movie);
    }
    await DemoDatabaseVM.db.commit();

    row_ids = await DemoDatabaseVM.db.movieLoadAllRowIds();
    loading = false;
    update();
  }

    btnBackClicked() {
    Get.back();
  }

}
