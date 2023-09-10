part of "app_bloc.dart";

class AppState extends Equatable {
  final BlocStatus status;
  final String? updateMessage;
  final String? errorMessage;

  final bool isFirstRun;
  final ThemeMode appTheme;

  const AppState({
    this.status = BlocStatus.initial,
    this.updateMessage,
    this.errorMessage,
    this.appTheme = ThemeMode.system,
    this.isFirstRun = true,
  });

  AppState copyWith({
    BlocStatus? status,
    String? updateMessage,
    String? errorMessage,
    bool? isFirstRun,
    ThemeMode? appTheme,
  }) {
    return AppState(
        status: status ?? this.status,
        updateMessage: updateMessage,
        errorMessage: errorMessage,
        appTheme: appTheme ?? this.appTheme,
        isFirstRun: isFirstRun ?? this.isFirstRun);
  }

  @override
  List<Object?> get props => [
        status,
        updateMessage,
        errorMessage,
        appTheme,
        isFirstRun,
      ];
}
