part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class InitializeSettings extends SettingsEvent {}

class UpdateTheme extends SettingsEvent {
  final ThemeMode themeMode;

  const UpdateTheme({required this.themeMode});
}

class ClearCache extends SettingsEvent {}
