import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wayo/configs/enums.dart';
import 'package:wayo/exception.dart';
import 'package:wayo/locator.dart';
import 'package:wayo/repositories/settings_repository.dart';

part 'config_event.dart';
part 'config_state.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  ConfigBloc() : super(const ConfigState()) {
    on<InitializeApp>(_onInitializeApp);
  }

  void _onInitializeApp(
    InitializeApp event,
    Emitter<ConfigState> emit,
  ) async {
    emit(state.copyWith(status: LoadingStatus.loading));
    try {
      final settingsRepo = locator.get<SettingsReposistory>();
      await settingsRepo.setupNotifications();
      emit(state.copyWith(status: LoadingStatus.success));
    } on CustomException {
      emit(state.copyWith(status: LoadingStatus.failure));
    }
  }
}
