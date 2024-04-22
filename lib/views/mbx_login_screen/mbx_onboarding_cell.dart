import '../../models/mbx_onboarding_model.dart';
import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxOnboardingCell extends StatelessWidget {
  final MbxOnboardingModel onboarding;
  MbxOnboardingCell(this.onboarding);

  @override
  Widget build(BuildContext context) {
    return ContainerX(
        padding: EdgeInsets.all(24.0),
        child: Center(
            child: ListView(
          children: [
            ImageX(
              url: onboarding.image,
              height: 340.0,
              width: 340.0,
              fit: BoxFit.contain,
            ),
            ContainerX(height: 4.0),
            ContainerX(
              child: TextX(
                onboarding.title,
                color: ColorX.black,
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center,
                maxLines: 8,
              ),
            ),
            ContainerX(height: 4.0),
            ContainerX(
                child: TextX(
              onboarding.description,
              color: ColorX.gray,
              fontSize: 17.0,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
              maxLines: 8,
            )),
          ],
        )));
  }
}
