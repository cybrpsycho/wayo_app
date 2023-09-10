import "dart:async";

import "package:latlong2/latlong.dart";
import "package:location/location.dart";

class LocationService {
  Future<LatLng> getLocation() async {
    final location = await Location().getLocation();
    return LatLng(location.latitude!, location.longitude!);
  }
}
