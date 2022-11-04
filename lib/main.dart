import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wayo/blocs/config_bloc/config_bloc.dart';
import 'package:wayo/configs/router.dart';
import 'package:wayo/configs/theme_dark.dart';
import 'package:wayo/configs/theme_light.dart';
import 'package:wayo/locator.dart';

import 'firebase_options.dart';

void main() async {
  await setup();
  runApp(const App());
}

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAppCheck.instance.activate(androidDebugProvider: true);
  setupLocator();
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final ConfigBloc _configBloc;

  @override
  void initState() {
    super.initState();
    _configBloc = ConfigBloc()..add(InitializeApp());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _configBloc,
      child: BlocSelector<ConfigBloc, ConfigState, ThemeMode>(
        bloc: _configBloc,
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
      ),
    );
  }
}
