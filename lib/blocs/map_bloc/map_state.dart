part of 'map_bloc.dart';

class MapState extends Equatable {
  final LoadingStatus status;
  final LatLng initialLocation;
  final Stream<LatLng>? currentLocation;
  final String? mapThemeConfig;

  const MapState({
    this.status = LoadingStatus.initial,
    this.initialLocation = const LatLng(0, 0),
    this.currentLocation,
    this.mapThemeConfig,
  });

  MapState copyWith({
    required LoadingStatus status,
    LatLng? initialLocation,
    Stream<LatLng>? currentLocation,
    String? mapThemeConfig,
  }) {
    return MapState(
      status: status,
      initialLocation: initialLocation ?? this.initialLocation,
      currentLocation: currentLocation ?? this.currentLocation,
      mapThemeConfig: mapThemeConfig ?? this.mapThemeConfig,
    );
  }

  @override
  List<Object?> get props => [
        status,
        initialLocation,
        currentLocation,
        mapThemeConfig,
      ];
}
