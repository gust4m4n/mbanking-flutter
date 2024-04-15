import 'package:client_information/client_information.dart';

import '../utils/api_x.dart';
import 'mbx_baseurl_vm.dart';
import 'mbx_profile_vm.dart';

class MbxApi {
  static addRequiredHeader(Map<String, Object?> header) async {
    ClientInformation info = await ClientInformation.fetch();
    header['X-DEVICE-ID'] = info.deviceId;
    header['X-DEVICE-NAME'] = info.deviceName;
    header['X-DEVICE-OS'] = info.osName;
    header['X-DEVICE-OS-VERSION'] = info.osVersion;
    header['X-DEVICE-OS-VERSION-CODE'] = info.osVersionCode;
    final token = MbxProfileVM.profile.token;
    if (token.isNotEmpty) {
      header['Authorization'] = 'Bearer $token';
    }
  }

  static Future<ApiXResponse> get(
      {required String endpoint,
      Map<String, Object?>? params,
      Map<String, Object?>? headers,
      String contractFile = '',
      bool contract = false}) async {
    Map<String, Object?> newHeaders = {};
    headers?.forEach((key, value) {
      newHeaders[key] = value;
    });
    await addRequiredHeader(newHeaders);
    return ApiX.get(
            url: contract == false
                ? MbxBaseUrlVM.apiUrl(endpoint)
                : contractFile,
            params: params,
            headers: newHeaders)
        .then((resp) {
      handleResponse(resp);
      return resp;
    });
  }

  static Future<ApiXResponse> post(
      {required String endpoint,
      Map<String, Object>? params,
      Map<String, Object>? headers,
      bool json = false,
      String contractFile = '',
      bool contract = false}) async {
    Map<String, Object?> newHeaders = {};
    headers?.forEach((key, value) {
      newHeaders[key] = value;
    });
    await addRequiredHeader(newHeaders);
    return ApiX.post(
            url: contract == false
                ? MbxBaseUrlVM.apiUrl(endpoint)
                : contractFile,
            params: params,
            headers: newHeaders,
            json: json)
        .then((resp) {
      handleResponse(resp);
      return resp;
    });
  }

  static Future<ApiXResponse> delete(
      {required String endpoint,
      Map<String, Object>? params,
      Map<String, Object>? headers,
      String contractFile = '',
      bool contract = false}) async {
    Map<String, Object?> newHeaders = {};
    headers?.forEach((key, value) {
      newHeaders[key] = value;
    });
    await addRequiredHeader(newHeaders);
    return ApiX.delete(
            url: contract == false
                ? MbxBaseUrlVM.apiUrl(endpoint)
                : contractFile,
            params: params,
            headers: newHeaders)
        .then((resp) {
      handleResponse(resp);
      return resp;
    });
  }

  static Future<ApiXResponse> put(
      {required String endpoint,
      Map<String, Object>? params,
      Map<String, Object>? headers,
      bool json = false,
      String contractFile = '',
      bool mock = false}) async {
    Map<String, Object?> newHeaders = {};
    headers?.forEach((key, value) {
      newHeaders[key] = value;
    });
    await addRequiredHeader(newHeaders);
    return ApiX.put(
            url: mock == false ? MbxBaseUrlVM.apiUrl(endpoint) : contractFile,
            params: params,
            headers: newHeaders,
            json: json)
        .then((resp) {
      handleResponse(resp);
      return resp;
    });
  }

  static Future<ApiXResponse> postMultipart(
      {required String endpoint,
      Map<String, String?>? files,
      Map<String, Object?>? params,
      Map<String, Object?>? headers,
      String contractFile = '',
      bool contract = false}) async {
    Map<String, Object?> newHeaders = {};
    headers?.forEach((key, value) {
      newHeaders[key] = value;
    });
    await addRequiredHeader(newHeaders);
    return ApiX.postMultipart(
            url: contract == false
                ? MbxBaseUrlVM.apiUrl(endpoint)
                : contractFile,
            files: files,
            params: params,
            headers: newHeaders)
        .then((resp) {
      handleResponse(resp);
      return resp;
    });
  }

  static Future<ApiXResponse> putMultipart(
      {required String endpoint,
      Map<String, String?>? files,
      Map<String, Object?>? params,
      Map<String, Object?>? headers,
      String contractFile = '',
      bool contract = false}) async {
    Map<String, Object?> newHeaders = {};
    headers?.forEach((key, value) {
      newHeaders[key] = value;
    });
    await addRequiredHeader(newHeaders);
    return ApiX.putMultipart(
            url: contract == false
                ? MbxBaseUrlVM.apiUrl(endpoint)
                : contractFile,
            files: files,
            params: params,
            headers: newHeaders)
        .then((resp) {
      handleResponse(resp);
      return resp;
    });
  }

  static handleResponse(ApiXResponse resp) async {
    if (resp.status == 401) {
      await MbxProfileVM.logout();
    }
  }
}
