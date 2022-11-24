import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wayo/blocs/config_bloc/config_bloc.dart';
import 'package:wayo/blocs/data_bloc/data_bloc.dart';
import 'package:wayo/blocs/map_bloc/map_bloc.dart';
import 'package:wayo/configs/router.dart';
import 'package:wayo/configs/theme_dark.dart';
import 'package:wayo/configs/theme_light.dart';
import 'package:wayo/locator.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
  );
  setupLocator();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final ConfigBloc _configBloc;
  late final DataBloc _dataBloc;
  late final MapBloc _mapBloc;

  @override
  void initState() {
    super.initState();
    _configBloc = ConfigBloc()..add(InitializeApp());
    _dataBloc = DataBloc();
    _mapBloc = MapBloc()..add(InitializeMap());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _configBloc),
        BlocProvider.value(value: _dataBloc),
        BlocProvider.value(value: _mapBloc),
      ],
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
