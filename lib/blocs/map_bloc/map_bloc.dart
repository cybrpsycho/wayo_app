import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wayo/configs/constants.dart';
import 'package:wayo/configs/theme_dark.dart';
import 'package:wayo/configs/theme_light.dart';
import 'package:wayo/repositories/map_repository.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(const MapState()) {
    on<InitializeMap>(_onInitializeMap);
    on<GetCurrentLocation>(_onGetCurrentLocation);
    on<UpdateMapTheme>(_onUpdateMapTheme);
  }

  void _onInitializeMap(
    InitializeMap event,
    Emitter<MapState> emit,
  ) async {
    emit(state.copyWith(status: LoadingStatus.loading));
    try {
      final mapRepo = MapRepository();

      emit(state.copyWith(
        status: LoadingStatus.success,
        location: await mapRepo.getLocation(),
      ));
    } catch (e) {
      log('$e');
      emit(state.copyWith(status: LoadingStatus.failure));
    }
  }

  void _onGetCurrentLocation(
    GetCurrentLocation event,
    Emitter<MapState> emit,
  ) async {
    try {
      final mapRepo = MapRepository();

      emit(state.copyWith(
        status: LoadingStatus.success,
        location: await mapRepo.getLocation(),
      ));
    } catch (e) {
      log('$e');
      emit(state.copyWith(status: LoadingStatus.failure));
    }
  }

  void _onUpdateMapTheme(
    UpdateMapTheme event,
    Emitter<MapState> emit,
  ) async {
    emit(state.copyWith(status: LoadingStatus.failure));
    try {
      String mapThemeConfig;

      switch (event.brightness) {
        case Brightness.light:
          mapThemeConfig = mapLightThemeConfig;
          break;
        case Brightness.dark:
          mapThemeConfig = mapDarkThemeConfig;
          break;
      }

      emit(state.copyWith(
        status: LoadingStatus.success,
        mapThemeConfig: mapThemeConfig,
      ));
    } catch (e) {
      log('$e');
      emit(state.copyWith(status: LoadingStatus.failure));
    }
  }
}
