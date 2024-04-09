import '../../widgets/all_widgets.dart';

class MbaxProfileMenuButton extends StatelessWidget {
  final String title;
  final IconData? faIcon;
  final GestureTapCallback? onClicked;
  final bool toggle;
  final void Function(bool)? onToggleChanged;
  final bool toggleValue;

  MbaxProfileMenuButton(
      {Key? key,
      this.title = '',
      this.faIcon = null,
      this.onClicked,
      this.toggle = false,
      this.onToggleChanged = null,
      this.toggleValue = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerX(
      padding: EdgeInsets.only(left: 12.0, top: 0.0, right: 12.0, bottom: 0.0),
      child: InkWellX(
          highlightColor: ColorX.theme.withOpacity(0.1),
          cornerRadius: 8.0,
          onClicked: () {
            onClicked!();
          },
          child: ContainerX(
              padding:
                  EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0, bottom: 8.0),
              child: Row(
                children: [
                  ContainerX(
                    width: 40.0,
                    height: 40.0,
                    cornerRadius: 20.0,
                    backgroundColor: ColorX.theme.withOpacity(0.1),
                    child: Center(
                      child: ImageX(
                        faIcon: faIcon,
                        width: 20.0,
                        height: 20.0,
                        color: ColorX.black,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  TextX(
                    title,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500,
                    color: ColorX.black,
                  ),
                  Spacer(),
                  this.toggle
                      ? Switch(
                          value: toggleValue,
                          onChanged: onToggleChanged,
                          activeTrackColor: ColorX.lightGray,
                          activeColor: ColorX.theme,
                          inactiveTrackColor: ColorX.lightGray,
                          inactiveThumbColor: ColorX.gray,
                          trackOutlineColor:
                              MaterialStateProperty.resolveWith<Color?>(
                                  (_) => ColorX.transparent),
                          trackOutlineWidth:
                              MaterialStateProperty.resolveWith<double?>(
                                  (_) => 0.0),
                        )
                      : ImageX(
                          faIcon: FontAwesomeIcons.chevronRight,
                          width: 13.0,
                          height: 13.0,
                          color: ColorX.black,
                          fit: BoxFit.contain,
                        )
                ],
              ))),
    );
  }
}
