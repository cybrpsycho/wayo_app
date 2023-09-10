import "dart:developer";

import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:latlong2/latlong.dart";
import "package:wayo/config/dev_functions.dart";
import "package:wayo/config/enums.dart";
import "package:wayo/repositories/map_repository.dart";

part "map_event.dart";
part "map_state.dart";

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(const MapInitial()) {
    on<InitializeMap>(_onInitializeMap);
  }

  final _mapRepo = MapRepository();

  void _onInitializeMap(
    InitializeMap event,
    Emitter<MapState> emit,
  ) async {
    emit(const MapLoading());
    try {
      final location = await _mapRepo.getLocation();
      await simulateLatency();
      emit(MapInitialized(myLocation: location));
    } catch (e) {
      log("$e");
      emit(MapError(errorMessage: e.toString()));
    }
  }
}
