import "dart:developer";

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:get_it/get_it.dart";
import "package:go_router/go_router.dart";
import "package:wayo/blocs/app_bloc/app_bloc.dart";
import "package:wayo/config/enums.dart";
import "package:wayo/config/routes.dart";
import "package:wayo/locator.dart";

import "package:wayo/config/theme_dark.dart";
import "package:wayo/config/theme_light.dart";

Future<void> main() async {
  setupServiceLocators();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _router = GoRouter(
    navigatorKey: GlobalKey<NavigatorState>(),
    routes: appRoutes,
    initialLocation: "/splash",
    debugLogDiagnostics: kDebugMode ? true : false,
  );

  @override
  void initState() {
    super.initState();
    GetIt.I.get<AppBloc>().add(InitializeApp());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
      bloc: GetIt.I.get<AppBloc>(),
      listener: (context, state) {
        if (state.status == BlocStatus.failure) {
          log(state.errorMessage ?? "Unknown error");
        }
      },
      builder: (context, state) {
        return MaterialApp.router(
          title: "Wayo",
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: state.appTheme,
          routeInformationParser: _router.routeInformationParser,
          routeInformationProvider: _router.routeInformationProvider,
          routerDelegate: _router.routerDelegate,
        );
      },
    );
  }
}
