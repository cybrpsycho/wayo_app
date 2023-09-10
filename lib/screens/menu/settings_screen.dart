import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:get_it/get_it.dart";
import "package:sliver_tools/sliver_tools.dart";
import "package:wayo/blocs/app_bloc/app_bloc.dart";
import "package:wayo/widgets/frosted_appbar.dart";

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late final AppBloc _appBloc;

  @override
  void initState() {
    super.initState();
    _appBloc = GetIt.I.get<AppBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
      bloc: _appBloc,
      listener: (context, state) {},
      builder: (context, state) {
        return NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              const SliverPinnedHeader(child: FrostedAppBar()),
              SliverPinnedHeader(
                child: Container(
                  alignment: Alignment.center,
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: Text("work in progress".toUpperCase()),
                ),
              ),
            ];
          },
          body: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                title: Row(
                  children: [
                    const Text("App Theme"),
                    const Spacer(),
                    SizedBox(
                      width: 160,
                      child: DropdownButtonFormField(
                        elevation: 2,
                        value: state.appTheme,
                        items: ThemeMode.values.map((theme) {
                          return DropdownMenuItem(
                            value: theme,
                            child: Text(theme.name),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            _appBloc.add(UpdateTheme(themeMode: value));
                          }
                        },
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          filled: true,
                          fillColor:
                              Theme.of(context).primaryColor.withOpacity(0.1),
                        ),
                      ),
                    )
                  ],
                ),
                // trailing: ,
              ),
              ListTile(
                title: const Text("Clear app cache"),
                onTap: () => _appBloc.add(ClearCache()),
              )
            ],
          ),
        );
      },
    );
  }
}
