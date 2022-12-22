import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:location/location.dart';
import 'package:wayo/configs/constants.dart';
import 'package:wayo/features/shared/custom_exception.dart';

class PermissionsService {
  final _location = Location();
  final _messaging = FirebaseMessaging.instance;

  Future<PermissionStatus> getLocationPermission() async {
    bool serviceEnabled;

    serviceEnabled = await _location.serviceEnabled();
    if (serviceEnabled == false) {
      serviceEnabled = await _location.requestService();
      if (serviceEnabled == false) {
        throw CustomException(
          code: ExceptionCode.LOCATION_SERVICE_DISABLED,
          message: 'Location service has not been enabled',
        );
      }
    }

    return await _location.hasPermission();
  }

  Future<void> requestPermission({required PermissionType type}) async {
    switch (type) {
      case PermissionType.LOCATION:
        await _location.requestPermission();
        break;
      case PermissionType.NOTIFICATIONS:
        await _messaging.requestPermission();
        break;
      default:
    }
  }
}
