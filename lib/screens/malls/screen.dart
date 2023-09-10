import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";
import "package:sliver_tools/sliver_tools.dart";
import "package:wayo/blocs/mall_bloc/mall_bloc.dart";
import "package:wayo/config/enums.dart";
import "package:wayo/widgets/frosted_appbar.dart";
import "package:wayo/widgets/loaders.dart";
import "package:wayo/widgets/preview_tile.dart";

class MallsScreen extends StatefulWidget {
  const MallsScreen({super.key});

  @override
  State<MallsScreen> createState() => _MallsScreenState();
}

class _MallsScreenState extends State<MallsScreen> {
  late final MallBloc _mallBloc;

  @override
  void initState() {
    super.initState();
    _mallBloc = MallBloc()..add(const GetMalls());
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [const SliverPinnedHeader(child: FrostedAppBar())];
      },
      body: BlocBuilder<MallBloc, MallState>(
        bloc: _mallBloc,
        builder: (context, state) {
          switch (state.status) {
            case BlocStatus.initial:
              return const Center(child: CircularProgressIndicator());
            case BlocStatus.loading:
              return const LoadingList(
                mode: BuilderMode.listTile,
                direction: Axis.vertical,
                separated: false,
              );
            case BlocStatus.failure:
              return Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(24),
                child: const Text("App run into an error"),
              );
            case BlocStatus.success:
              (state as MallsFetched);
              return ListView.builder(
                itemBuilder: (context, index) {
                  final mall = state.malls[index];
                  return ListTile(
                    leading: PreviewTile(
                      imageUrl: mall.logoUrl,
                      placeholderName: mall.name,
                    ),
                    title: Text(mall.name),
                    subtitle: Text(mall.physicalAddress, maxLines: 2),
                    onTap: () {
                      context.goNamed("mall",
                          pathParameters: {"mallId": "${mall.id}"});
                    },
                  );
                },
                itemCount: state.malls.length,
              );
          }
        },
      ),
    );
  }
}
