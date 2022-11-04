import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:wayo/configs/enums.dart';
import 'package:wayo/exception.dart';
import 'package:wayo/locator.dart';
import 'package:wayo/services/location_service.dart';
import 'package:wayo/services/permissions_service.dart';

class MapRepository {
  Future<LatLng> getLocation() async {
    final permissionService = locator.get<PermissionsService>();
    final locationService = locator.get<LocationService>();

    final status = await permissionService.getLocationPermission();

    switch (status) {
      case PermissionStatus.granted:
        break;
      case PermissionStatus.denied:
        while (true) {
          await permissionService.requestPermission(
            type: PermissionType.LOCATION,
          );
          final status = await permissionService.getLocationPermission();
          if (status == PermissionStatus.granted) break;
        }
        break;
      case PermissionStatus.deniedForever:
        throw CustomException(
          code: ExceptionCode.LOCATION_PERMISSION_PERMADENIED,
          message: 'Location permission permanently denied',
        );
      default:
        throw CustomException(
          code: ExceptionCode.UNKNOWN,
          message: 'Unknown error occured',
        );
    }

    return await locationService.getLocation();
  }

  Future<Stream<LatLng>?> getLocationUpdates() async {
    final permissionService = locator.get<PermissionsService>();
    final locationService = locator.get<LocationService>();

    final status = await permissionService.getLocationPermission();

    if (status != PermissionStatus.granted) {
      throw CustomException(
        code: ExceptionCode.LOCATION_PERMISSION_DENIED,
        message: 'Location permission has not been granted',
      );
    }

    switch (status) {
      case PermissionStatus.denied:
        while (true) {
          await permissionService.requestPermission(
            type: PermissionType.LOCATION,
          );
          final status = await permissionService.getLocationPermission();
          if (status == PermissionStatus.granted) break;
        }
        break;
      case PermissionStatus.deniedForever:
        throw CustomException(
          code: ExceptionCode.LOCATION_PERMISSION_PERMADENIED,
          message: 'Location permission permanently denied',
        );
      default:
    }

    return await locationService.getCurrentLocation();
  }
}
