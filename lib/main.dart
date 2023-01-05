import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wayo/features/settings/providers/settings_bloc/settings_bloc.dart';
import 'package:wayo/locator.dart';
import 'package:wayo/router.dart';
import 'package:wayo/configs/theme_dark.dart';
import 'package:wayo/configs/theme_light.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
  );
  setupServiceLocator();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SettingsBloc, SettingsState, ThemeMode>(
      bloc: locator.get<SettingsBloc>(),
      selector: (state) => state.themeMode,
      builder: (context, state) {
        return MaterialApp.router(
          routeInformationParser: router.routeInformationParser,
          routeInformationProvider: router.routeInformationProvider,
          routerDelegate: router.routerDelegate,
          title: 'Wayo',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: state,
        );
      },
    );
  }
}
