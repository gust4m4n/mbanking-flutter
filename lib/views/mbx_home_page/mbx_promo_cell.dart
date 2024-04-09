import '../../models/demo_movie_model.dart';
import '../../widgets/all_widgets.dart';
import '../demo_html_screen/demo_html_screen.dart';

// ignore: must_be_immutable
class MbxPromoCell extends StatelessWidget {
  final DemoMovieModel movie;
  MbxPromoCell(this.movie);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 12.0),
        child: InkWellX(
          cornerRadius: 12.0,
          onClicked: () {
            Get.to(DemoHtmlScreen());
          },
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ImageX(
              url: movie.poster,
              width: double.infinity,
              height: 100.0,
              cornerRadius: 12.0,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 4.0),
            TextX(
              movie.title,
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
              color: ColorX.gray,
              textAlign: TextAlign.start,
              maxLines: 3,
            ),
            Spacer()
          ]),
        ));
  }
}
