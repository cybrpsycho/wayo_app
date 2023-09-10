import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:get_it/get_it.dart";
import "package:sliver_tools/sliver_tools.dart";
import "package:wayo/apis/mock_api.dart";
import "package:wayo/blocs/app_bloc/app_bloc.dart";
import "package:wayo/widgets/frosted_appbar.dart";

class LegalScreen extends StatefulWidget {
  const LegalScreen({super.key});

  @override
  State<LegalScreen> createState() => _LegalScreenState();
}

class _LegalScreenState extends State<LegalScreen> {
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
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    "work in progress".toUpperCase(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  Text("These Are The Policies Of Wayo"),
                  SizedBox(height: 16),
                  Text(
                    MockApi.policies,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
