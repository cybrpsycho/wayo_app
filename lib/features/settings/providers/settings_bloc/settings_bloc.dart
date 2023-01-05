import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wayo/configs/constants.dart';
import 'package:wayo/features/settings/repositories/settings_repository.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState()) {
    on<InitializeSettings>(_onInitializeSettings);
    on<UpdateTheme>(_onUpdateTheme);
    on<ClearCache>(_onClearCache);
  }

  final _settingsRepo = SettingsReposistory();

  void _onInitializeSettings(
    InitializeSettings event,
    Emitter<SettingsState> emit,
  ) async {
    emit(state.copyWith(status: LoadingStatus.loading));
    try {
      emit(state.copyWith(
        status: LoadingStatus.success,
        themeMode: await _settingsRepo.getThemeMode(),
      ));
    } catch (e) {
      emit(state.copyWith(status: LoadingStatus.failure));
    }
  }

  void _onUpdateTheme(
    UpdateTheme event,
    Emitter<SettingsState> emit,
  ) async {
    emit(state.copyWith(status: LoadingStatus.loading));
    try {
      await _settingsRepo.setThemeMode(event.themeMode);
      emit(state.copyWith(
        status: LoadingStatus.success,
        themeMode: await _settingsRepo.getThemeMode(),
      ));
    } catch (e) {
      emit(state.copyWith(status: LoadingStatus.failure));
    }
  }

  void _onClearCache(
    ClearCache event,
    Emitter<SettingsState> emit,
  ) async {
    // TODO: implement event handler
  }
}
