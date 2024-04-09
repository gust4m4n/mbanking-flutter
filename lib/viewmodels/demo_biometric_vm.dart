import 'dart:async';
import '../widgets/all_widgets.dart';

class DemoBiometricVM {
  static Future<bool> isAvailable() async {
    final LocalAuthentication auth = LocalAuthentication();
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate =
        canAuthenticateWithBiometrics || await auth.isDeviceSupported();
    return canAuthenticate;
  }

  static Future<bool> request() async {
    final LocalAuthentication auth = LocalAuthentication();
    try {
      final bool authenticated = await auth.authenticate(
          localizedReason: 'Biometric',
          options: const AuthenticationOptions(biometricOnly: true));
      return authenticated;
    } on PlatformException {
      // Try again later
      return false;
    }
  }
}
