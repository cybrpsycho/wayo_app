import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as lc;

class LocationService {
  Future<LatLng> getLocation() async {
    final location = await lc.Location().getLocation();
    return LatLng(location.latitude!, location.longitude!);
  }

  Future<Stream<LatLng>> getCurrentLocation() async {
    final controller = StreamController<LatLng>();
    final location = lc.Location();

    location.changeSettings(accuracy: lc.LocationAccuracy.powerSave);
    location.onLocationChanged.listen((event) {
      controller.add(LatLng(event.latitude!, event.longitude!));
    });

    return controller.stream;
  }

  Future<void> geocodeAddress({required String address}) async {
    // https://maps.googleapis.com/maps/api/geocode/json?address=[]&key=YOUR_API_KEY
  }

  Future<void> reverseGeocodeCoordinates({required LatLng coordinates}) async {
    // https://maps.googleapis.com/maps/api/geocode/json?latlng=[],[]]&key=YOUR_API_KEY
  }
}
