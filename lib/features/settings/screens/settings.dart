import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wayo/features/settings/providers/settings_bloc/settings_bloc.dart';
import 'package:wayo/features/shared/widgets/appbar_wrapper.dart';
import 'package:wayo/locator.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late final SettingsBloc _settingsBloc;

  @override
  void initState() {
    super.initState();
    _settingsBloc = locator.get<SettingsBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsBloc, SettingsState>(
      bloc: _settingsBloc,
      listener: (context, state) {},
      builder: (context, state) {
        return AppbarWrapper(
          appbarTitle: const Text('Settings'),
          body: ListView(
            children: [
              ListTile(
                title: const Text('App Theme'),
                trailing: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: state.themeMode,
                    items: ThemeMode.values.map((theme) {
                      return DropdownMenuItem(
                        value: theme,
                        child: Text(theme.name),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        _settingsBloc.add(UpdateTheme(themeMode: value));
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
