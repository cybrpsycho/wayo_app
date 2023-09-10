part of "map_bloc.dart";

abstract class MapState extends Equatable {
  final BlocStatus status;

  const MapState({this.status = BlocStatus.initial});

  @override
  List<Object?> get props => [status];
}

class MapInitial extends MapState {
  const MapInitial({super.status = BlocStatus.initial});
}

class MapLoading extends MapState {
  const MapLoading({super.status = BlocStatus.loading});
}

class MapError extends MapState {
  final String errorMessage;

  const MapError({
    super.status = BlocStatus.failure,
    required this.errorMessage,
  });

  @override
  List<Object> get props => [errorMessage];
}

class MapInitialized extends MapState {
  final LatLng myLocation;

  const MapInitialized({
    super.status = BlocStatus.success,
    required this.myLocation,
  });

  @override
  List<Object> get props => [myLocation];
}
