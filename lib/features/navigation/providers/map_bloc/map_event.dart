part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object?> get props => [];
}

class InitializeMap extends MapEvent {}

class GetCurrentLocation extends MapEvent {}

class ChangeMapTheme extends MapEvent {}
