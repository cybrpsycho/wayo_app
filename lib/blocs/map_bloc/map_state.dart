part of 'map_bloc.dart';

class MapState extends Equatable {
  final LoadingStatus status;
  final LatLng location;
  final Stream<LatLng>? locationStream;
  final String? mapThemeConfig;

  const MapState({
    this.status = LoadingStatus.initial,
    this.location = const LatLng(0, 0),
    this.locationStream,
    this.mapThemeConfig,
  });

  MapState copyWith({
    required LoadingStatus status,
    LatLng? location,
    LatLng? currentLocation,
    Stream<LatLng>? locationStream,
    String? mapThemeConfig,
  }) {
    return MapState(
      status: status,
      location: location ?? this.location,
      locationStream: locationStream ?? this.locationStream,
      mapThemeConfig: mapThemeConfig ?? this.mapThemeConfig,
    );
  }

  @override
  List<Object?> get props => [status, location, locationStream, mapThemeConfig];
}
