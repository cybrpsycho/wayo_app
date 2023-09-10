import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:sliver_tools/sliver_tools.dart";
import "package:wayo/blocs/mall_bloc/mall_bloc.dart";
import "package:wayo/blocs/store_bloc/store_bloc.dart";
import "package:wayo/config/enums.dart";
import "package:wayo/screens/mall_info/screen.dart";
import "package:wayo/widgets/frosted_appbar.dart";
import "package:wayo/widgets/preview_tile.dart";

class StoreScreen extends StatefulWidget {
  final String storeId;

  const StoreScreen({super.key, required this.storeId});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  late final StoreBloc _storeBloc;
  late final MallBloc _mallBloc;

  @override
  void initState() {
    super.initState();

    _storeBloc = StoreBloc()..add(GetStore(storeId: widget.storeId));
    _mallBloc = MallBloc()..add(GetMalls(storeId: widget.storeId));
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverPinnedHeader(
            child: FrostedAppBar(
              title: BlocBuilder<StoreBloc, StoreState>(
                bloc: _storeBloc,
                builder: (context, state) {
                  if (state is StoreFetched) return Text(state.store.name);
                  return const SizedBox();
                },
              ),
            ),
          ),
        ];
      },
      body: BlocBuilder<StoreBloc, StoreState>(
        bloc: _storeBloc,
        builder: (context, state) {
          switch (state.status) {
            case BlocStatus.initial:
              return const Center(child: CircularProgressIndicator());
            case BlocStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case BlocStatus.failure:
              return Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(24),
                child: Text(state.message ?? "App ran into error"),
              );
            case BlocStatus.success:
              (state as StoreFetched);
              final store = state.store;
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 160,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                CachedNetworkImageProvider(store.featureImage),
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.5),
                              BlendMode.multiply,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: ListTile(
                          tileColor: Theme.of(context).colorScheme.secondary,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 24),
                          title: Text(
                            "Description".toUpperCase(),
                            style: const TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            store.description ?? "no description provided",
                            style: const TextStyle(color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 16)),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text("Malls with this store".toUpperCase()),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: BlocBuilder<MallBloc, MallState>(
                      bloc: _mallBloc,
                      builder: (context, state) {
                        if (state.status == BlocStatus.success) {
                          state as MallsFetched;
                          return GridView.builder(
                            // FIXME: shrink wrap should not be true for unpredicatble list lengths
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            gridDelegate: _sliverGridDelegate,
                            itemBuilder: (context, index) {
                              final mall = state.malls[index];
                              return PreviewTile(
                                imageUrl: mall.logoUrl,
                                placeholderName: mall.name,
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return MallInfoScreen(
                                            mallId: "${mall.id}");
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                            itemCount: state.malls.length,
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  )
                ],
              );
          }
        },
      ),
    );
  }

  SliverGridDelegate get _sliverGridDelegate {
    return const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1,
    );
  }
}
