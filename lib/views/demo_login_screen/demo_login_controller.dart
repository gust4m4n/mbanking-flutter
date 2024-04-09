import '../../utils/all_utils.dart';
import '../../viewmodels/mbx_anti_jailbreak_vm.dart';
import '../../widgets/all_widgets.dart';
import '../demo_string_picker/demo_string_picker.dart';

class DemoLoginController extends SuperController {
  final txtUsernameController = TextEditingController();
  final txtUsernameNode = FocusNode();
  var txtUsernameError = '';
  bool securedPassword = true;
  final txtPasswordController = TextEditingController();
  final txtPasswordNode = FocusNode();
  var txtPasswordError = '';
  final txtRegionController = TextEditingController();
  var txtRegionError = '';

  @override
  void onReady() {
    super.onReady();
    txtUsernameError = '';
    txtPasswordError = '';
    txtRegionError = '';
    update();
  }

  btnBackClicked() {
    Get.back();
  }

  @override
  void onDetached() {
    LoggerX.log('[DemoLoginController] onDetached');
  }

  @override
  void onInactive() {
    LoggerX.log('[DemoLoginController] onInactive');
  }

  @override
  void onPaused() {
    LoggerX.log('[DemoLoginController] onPaused');
  }

  @override
  Future<void> onResumed() async {
    LoggerX.log('[DemoLoginController] onResumed');
    await MbxAntiJailbreakVM.check();
  }

  btnRegionDropdownClicked() {
    final sheet = DemoStringPicker(
        title: 'String Picker',
        list: ['Klaten', 'Jakarta', 'Surabaya', 'Singapura']);
    sheet.show().then((value) {
      if (value != null) {
        LoggerX.log('Selection: $value');
        txtRegionController.text = value;
      }
    });
  }

  btnForgotPasswordClicked() {
    FocusManager.instance.primaryFocus?.unfocus();
    Get.back();
  }

  btnSignInClicked() {
    FocusManager.instance.primaryFocus?.unfocus();
    txtUsernameError = '';
    txtPasswordError = '';
    txtRegionError = '';
    update();

    if (txtUsernameController.text.trim().isEmpty) {
      txtUsernameError = 'Username cannot be empty.';
      FocusScope.of(Get.context!).requestFocus(txtUsernameNode);
      update();
      return;
    }

    if (txtPasswordController.text.trim().isEmpty) {
      txtPasswordError = 'Password cannot be empty.';
      FocusScope.of(Get.context!).requestFocus(txtPasswordNode);
      update();
      return;
    }

    if (txtRegionController.text.trim().isEmpty) {
      txtRegionError = 'You must select region.';
      update();
      return;
    }

    Get.back();
  }

  @override
  void onHidden() {}
}
