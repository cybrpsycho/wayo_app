import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:get_it/get_it.dart";
import "package:sliver_tools/sliver_tools.dart";
import "package:wayo/blocs/app_bloc/app_bloc.dart";
import "package:wayo/widgets/frosted_appbar.dart";
import "package:wayo/widgets/preview_tile.dart";

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
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
          body: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: ListTile(
                  dense: true,
                  title: Text("Unread"),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ListTile(
                      leading: const PreviewTile(),
                      title: Text("Notification #${index + 1}"),
                      subtitle: const Text("Notification brief"),
                    );
                  },
                  childCount: 3,
                ),
              ),
              const SliverToBoxAdapter(
                child: ListTile(
                  dense: true,
                  title: Text("All Notifications"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
