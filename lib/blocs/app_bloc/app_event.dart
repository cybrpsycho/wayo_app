part of "app_bloc.dart";

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class InitializeApp extends AppEvent {}

class UpdateTheme extends AppEvent {
  final ThemeMode themeMode;

  const UpdateTheme({required this.themeMode});
}

class ClearCache extends AppEvent {}
