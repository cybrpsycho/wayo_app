import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:wayo/configs/constants.dart';
import 'package:wayo/models/custom_exception.dart';

class NotificationApi {
  final _messaging = FirebaseMessaging.instance;

  Future<void> getToken() async {
    final token = await _messaging.getToken();

    if (token == null) {
      throw CustomException(
        code: ExceptionCode.UNKNOWN,
        message: 'An error occurred when fetching a token',
      );
    }

    log('FCM Token: $token');

    // TODO: Update DB with new token value on token update
    // _messaging.onTokenRefresh.listen((token) {});
  }

  Future<void> getNoticiations() async {}
}
