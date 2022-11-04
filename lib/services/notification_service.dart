import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:wayo/configs/enums.dart';
import 'package:wayo/exception.dart';

class NotificationService {
  final _messaging = FirebaseMessaging.instance;

  Future<String> getFCMToken() async {
    final token = await _messaging.getToken();

    if (token == null) {
      throw CustomException(
        code: ExceptionCode.UNKNOWN,
        message: 'An error occurred when fetching a token',
      );
    }

    return token;
  }

  void subToFCMTokenUpdates() {
    _messaging.onTokenRefresh.listen((token) {
      // TODO: Update DB with new token value on token update
    });
  }
}
