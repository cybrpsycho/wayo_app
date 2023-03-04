part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final LoadingStatus status;
  final ThemeMode themeMode;

  const SettingsState({
    this.status = LoadingStatus.initial,
    this.themeMode = ThemeMode.system,
  });

  SettingsState copyWith({
    LoadingStatus? status,
    ThemeMode? themeMode,
  }) {
    return SettingsState(
      status: status ?? this.status,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  List<Object> get props => [status, themeMode];
}
