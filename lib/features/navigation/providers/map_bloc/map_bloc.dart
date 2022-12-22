import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wayo/configs/constants.dart';
import 'package:wayo/configs/theme_dark.dart';
import 'package:wayo/configs/theme_light.dart';
import 'package:wayo/features/shared/custom_exception.dart';
import 'package:wayo/features/navigation/repositories/map_repository.dart';
import 'package:wayo/features/settings/repositories/settings_repository.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(const MapState()) {
    on<InitializeMap>(_onInitializeMap);
    on<GetCurrentLocation>(_onGetCurrentLocation);
    on<ChangeMapTheme>(_onChangeMapTheme);
  }

  void _onInitializeMap(
    InitializeMap event,
    Emitter<MapState> emit,
  ) async {
    emit(state.copyWith(status: LoadingStatus.loading));
    try {
      final mapRepo = MapRepository();
      final settingsRepo = SettingsReposistory();

      final themeMode = await settingsRepo.getThemeMode();
      String? mapThemeConfig;

      switch (themeMode) {
        case ThemeMode.light:
          mapThemeConfig = mapLightThemeConfig;
          break;
        case ThemeMode.dark:
          mapThemeConfig = mapDarkThemeConfig;
          break;
        default:
      }

      emit(state.copyWith(
        status: LoadingStatus.success,
        location: await mapRepo.getLocation(),
        mapThemeConfig: mapThemeConfig,
      ));
    } on CustomException {
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
    } on CustomException {
      emit(state.copyWith(status: LoadingStatus.failure));
    }
  }

  void _onChangeMapTheme(
    ChangeMapTheme event,
    Emitter<MapState> emit,
  ) async {
    emit(state.copyWith(status: LoadingStatus.failure));
    try {
      final settingsRepo = SettingsReposistory();

      final themeMode = await settingsRepo.getThemeMode();
      String? mapThemeConfig;

      switch (themeMode) {
        case ThemeMode.light:
          mapThemeConfig = mapLightThemeConfig;
          break;
        case ThemeMode.dark:
          mapThemeConfig = mapDarkThemeConfig;
          break;
        default:
      }

      emit(state.copyWith(
        status: LoadingStatus.success,
        mapThemeConfig: mapThemeConfig,
      ));
    } on CustomException {
      emit(state.copyWith(status: LoadingStatus.failure));
    }
  }
}
