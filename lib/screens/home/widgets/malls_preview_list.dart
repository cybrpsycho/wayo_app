import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";
import "package:wayo/blocs/mall_bloc/mall_bloc.dart";
import "package:wayo/config/enums.dart";
import "package:wayo/widgets/loaders.dart";
import "package:wayo/widgets/preview_tile.dart";

class MallsPreviewList extends StatefulWidget {
  const MallsPreviewList({super.key});

  @override
  State<MallsPreviewList> createState() => _MallsPreviewListState();
}

class _MallsPreviewListState extends State<MallsPreviewList> {
  late final MallBloc _mallBloc;

  @override
  void initState() {
    super.initState();
    _mallBloc = MallBloc()..add(const GetMalls());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MallBloc, MallState>(
      bloc: _mallBloc,
      builder: (context, state) {
        switch (state.status) {
          case BlocStatus.initial:
            return const LoadingList(
              mode: BuilderMode.squareTile,
              direction: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 2),
            );
          case BlocStatus.loading:
            return const LoadingList(
              mode: BuilderMode.squareTile,
              direction: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 2),
            );
          case BlocStatus.failure:
            return Container(
              height: 76,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(24),
              child: const Text("App run into an error"),
            );
          case BlocStatus.success:
            (state as MallsFetched);
            final malls = state.malls..shuffle();
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 2),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final mall = malls[index];
                return PreviewTile(
                  imageUrl: mall.logoUrl,
                  placeholderName: mall.name,
                  onTap: () {
                    context.goNamed("mall",
                        pathParameters: {"mallId": "${mall.id}"});
                  },
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 16),
              itemCount: state.malls.length > 8 ? 8 : state.malls.length,
            );
        }
      },
    );
  }
}
