import "package:equatable/equatable.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:is_first_run/is_first_run.dart";
import "package:wayo/config/enums.dart";
import "package:wayo/repositories/settings_repository.dart";

part "app_event.dart";
part "app_state.dart";

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<InitializeApp>(_onInitializeApp);
    on<UpdateTheme>(_onUpdateTheme);
    on<ClearCache>(_onClearCache);
  }

  final _settingsRepo = SettingsRepository();

  void _onInitializeApp(
    InitializeApp event,
    Emitter<AppState> emit,
  ) async {
    emit(state.copyWith(status: BlocStatus.loading));
    try {
      emit(state.copyWith(
        status: BlocStatus.success,
        appTheme: await _settingsRepo.getThemeMode(),
        isFirstRun: await IsFirstRun.isFirstRun(),
      ));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  void _onUpdateTheme(
    UpdateTheme event,
    Emitter<AppState> emit,
  ) async {
    emit(state.copyWith(status: BlocStatus.loading));
    try {
      await _settingsRepo.setThemeMode(event.themeMode);
      emit(state.copyWith(
        status: BlocStatus.success,
        appTheme: await _settingsRepo.getThemeMode(),
      ));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  void _onClearCache(
    ClearCache event,
    Emitter<AppState> emit,
  ) async {
    emit(state.copyWith(status: BlocStatus.loading));
    try {
      await _settingsRepo.clearCache();
      emit(state.copyWith(updateMessage: "Cleared app cache"));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }
}
