import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";
import "package:sliver_tools/sliver_tools.dart";
import "package:text_scroll/text_scroll.dart";
import "package:wayo/blocs/store_bloc/store_bloc.dart";
import "package:wayo/widgets/frosted_appbar.dart";
import "package:wayo/config/enums.dart";

class StoresScreen extends StatefulWidget {
  const StoresScreen({super.key});

  @override
  State<StoresScreen> createState() => _StoresScreenState();
}

class _StoresScreenState extends State<StoresScreen> {
  late final StoreBloc _storeBloc;

  @override
  void initState() {
    super.initState();
    _storeBloc = StoreBloc()..add(GetStores());
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          const SliverPinnedHeader(
              child: FrostedAppBar(
            title: Text("Stores"),
          ))
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
                child: Text(state.message ?? "App run into an error"),
              );
            case BlocStatus.success:
              (state as StoresFetched);
              return GridView.builder(
                gridDelegate: _sliverGridDelegate,
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  final store = state.stores[index];
                  return GestureDetector(
                    onTap: () => context.goNamed(
                      "store",
                      pathParameters: {"storeId": "${store.id}"},
                    ),
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            store.featureImage,
                            errorListener: () => print("failed to load image"),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(8),
                        color: Theme.of(context).colorScheme.surface,
                        child: Row(
                          children: [
                            SizedBox.square(
                              dimension: 40,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                        store.logoUrl),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(child: TextScroll(store.name))
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: state.stores.length,
              );
          }
        },
      ),
    );
  }

  get _sliverGridDelegate => const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1,
      );
}
