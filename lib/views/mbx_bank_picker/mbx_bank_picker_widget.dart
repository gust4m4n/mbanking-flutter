import '../../models/demo_movie_model.dart';
import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxBankPickerWidget extends StatelessWidget {
  final DemoMovieModel movie;
  MbxBankPickerWidget(this.movie);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 16.0, top: 12.0, right: 16.0, bottom: 12.0),
      child: TextX(movie.title),
    );
  }
}
