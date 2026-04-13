import 'package:flutter/services.dart';
import 'package:kawach/utils/shared_pref.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';

class AuthService {
  Future<bool> authenticatelocally() async {
    bool isAuthenticate = false;
    bool isdisablebyuser = await MySharedPref.readBooleanValue("disable_biometric");
    print("is enable by user $isdisablebyuser");
    final LocalAuthentication auth = LocalAuthentication();
    final List<BiometricType> availablebiometric = await auth.getAvailableBiometrics();
    bool issupported = await auth.isDeviceSupported();
    print("available biometrics $availablebiometric");
    if (isdisablebyuser) {
      return false;
    }
    if (!issupported) {
      print("biometric is not supported on this device");
      return isAuthenticate;
    }

    try {
      if (availablebiometric.isEmpty) {
        print("no biometric enrolled");
        return isAuthenticate;
      }
      isAuthenticate = await auth.authenticate(localizedReason: "Authenticate By Fingerprint", options: AuthenticationOptions(useErrorDialogs: true));
    } on PlatformException catch (e) {
      switch (e.code) {
        case auth_error.notEnrolled:
          print("No biometric enrolled");
          break;

        case auth_error.notAvailable:
          print("Biometric not available on device");
          break;

        case auth_error.lockedOut:
          print("Too many attempts. Try later");
          break;

        case auth_error.permanentlyLockedOut:
          print("Biometric permanently locked");
          break;

        default:
          print("Unknown error: ${e.code}");
      }
      //switch ()
    } catch (e) {
      print("error while authentication $e");
    }
    return isAuthenticate;
  }
}
