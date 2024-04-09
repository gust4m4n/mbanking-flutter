import '../../models/demo_movie_model.dart';
import '../../viewmodels/mbx_format_vm.dart';
import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class DemoDatabaseCell extends StatelessWidget {
  final DemoMovieModel movie;
  DemoDatabaseCell(this.movie);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0, bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageX(
              url: movie.poster,
              width: 84.0,
              height: 84.0,
              cornerRadius: 12.0,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 12.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextX(
                    movie.title,
                    color: ColorX.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.start,
                    maxLines: 2048,
                  ),
                  SizedBox(height: 4.0),
                  TextX(
                    MbxFormatVM.currencyUSD(value: movie.revenue),
                    color: ColorX.black,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.start,
                    maxLines: 2048,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
