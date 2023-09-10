import "package:latlong2/latlong.dart";
import "package:location/location.dart";
import "package:wayo/config/enums.dart";
import "package:wayo/models/custom_exception.dart";
import "package:wayo/services/location_service.dart";
import "package:wayo/services/permissions_service.dart";

class MapRepository {
  Future<LatLng> getLocation() async {
    final permissionService = PermissionsService();
    final locationService = LocationService();

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
          message: "Location permission permanently denied",
        );
      default:
        throw CustomException(
          code: ExceptionCode.UNKNOWN,
          message: "Unknown error occurred",
        );
    }

    return await locationService.getLocation();
  }
}
