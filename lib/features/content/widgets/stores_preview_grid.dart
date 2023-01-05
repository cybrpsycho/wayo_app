import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_scroll/text_scroll.dart';
import 'package:wayo/features/content/providers/store_bloc/store_bloc.dart';

class StoresPreviewGrid extends StatefulWidget {
  const StoresPreviewGrid({super.key});

  @override
  State<StoresPreviewGrid> createState() => _StoresPreviewGridState();
}

class _StoresPreviewGridState extends State<StoresPreviewGrid> {
  late final StoreBloc _storeBloc;

  @override
  void initState() {
    super.initState();
    _storeBloc = StoreBloc()..add(GetStores());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreBloc, StoreState>(
      bloc: _storeBloc,
      builder: (context, state) {
        if (state is StoreLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is StoresFetched) {
          return SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final store = state.stores[index];
                return Column(
                  children: [
                    const Expanded(
                      child: CircleAvatar(
                        radius: 40,
                        child: Icon(Icons.storefront_outlined),
                      ),
                    ),
                    TextScroll(
                      store.name,
                      velocity: const Velocity(
                        pixelsPerSecond: Offset(16, 0),
                      ),
                      intervalSpaces: 4,
                      delayBefore: const Duration(seconds: 3),
                    ),
                  ],
                );
              },
              childCount: state.stores.length > 12 ? 12 : state.stores.length,
            ),
          );
        }
        if (state is StoreError) {
          return SliverToBoxAdapter(
            child: Container(
              height: 76,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(24),
              child: const Text('App run into an error'),
            ),
          );
        }
        return const SliverToBoxAdapter(child: SizedBox());
      },
    );
  }
}
