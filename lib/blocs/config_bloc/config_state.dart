part of 'config_bloc.dart';

class ConfigState extends Equatable {
  final LoadingStatus status;
  final ThemeMode themeMode;
  const ConfigState({
    this.status = LoadingStatus.initial,
    this.themeMode = ThemeMode.system,
  });

  ConfigState copyWith({
    required LoadingStatus status,
    ThemeMode? themeMode,
  }) {
    return ConfigState(
      status: status,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  List<Object> get props => [status, themeMode];
}
