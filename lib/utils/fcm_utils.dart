import 'dart:convert';

import 'package:http/http.dart' as http;

import '../utils/logger_x.dart';

Future<bool> fcmSendPushNotification(
    List<String> userToken, String title, String body) async {
  const url = 'https://fcm.googleapis.com/fcm/send';
  const serverKey = 'YOUR_SERVER_KEY';

  final data = {
    "registration_ids": userToken,
    "priority": "high",
    "notification": {
      "title": title,
      "body": body,
      "sound": "default",
    },
    "data": {
      "title": title,
      "body": body,
      "some": "data",
    }
  };

  final headers = {
    'content-type': 'application/json',
    'Authorization': 'key=$serverKey'
  };

  String jsonString = json.encode(data);
  LoggerX.log('[FCM] json: $jsonString');

  final response = await http.post(Uri.parse(url),
      body: json.encode(data),
      encoding: Encoding.getByName('utf-8'),
      headers: headers);

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
