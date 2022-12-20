import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:wayo/configs/enums.dart';
import 'package:wayo/features/shared/custom_exception.dart';

class NotificationApi {
  // final _ref = FirebaseFirestore.instance.collection('notifications');
  final _messaging = FirebaseMessaging.instance;

  Future<void> setToken(String token) async {
    final token = await _messaging.getToken();

    if (token == null) {
      throw CustomException(
        code: ExceptionCode.UNKNOWN,
        message: 'An error occurred when fetching a token',
      );
    }

    _messaging.onTokenRefresh.listen((token) {
      // TODO: Update DB with new token value on token update
    });
  }

  Future<void> getNoticiations() async {}
}
