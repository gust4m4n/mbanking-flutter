import '../../models/mbx_onboarding_model.dart';
import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxOnboardingCell extends StatelessWidget {
  final MbxOnboardingModel onboarding;
  MbxOnboardingCell(this.onboarding);

  @override
  Widget build(BuildContext context) {
    return ImageX(
      url: onboarding.image,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
