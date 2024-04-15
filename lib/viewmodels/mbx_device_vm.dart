import 'dart:async';
import 'package:client_information/client_information.dart';

class MbxDeviceVM {
  static Future<String> deviceId() async {
    ClientInformation info = await ClientInformation.fetch();
    return info.deviceId;
  }

  static Future<String> deviceName() async {
    ClientInformation info = await ClientInformation.fetch();
    return info.deviceName;
  }

  static Future<String> deviceOSName() async {
    ClientInformation info = await ClientInformation.fetch();
    return info.osName;
  }

  static Future<String> deviceOSVersion() async {
    ClientInformation info = await ClientInformation.fetch();
    return info.osVersion;
  }

  static Future<String> deviceOSVersionCode() async {
    ClientInformation info = await ClientInformation.fetch();
    return '${info.osVersionCode}';
  }
}
