import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class DemoStringPickerWidget extends StatelessWidget {
  final String value;
  DemoStringPickerWidget(this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 24.0, top: 16.0, right: 24.0, bottom: 16.0),
      child: TextX(value),
    );
  }
}
