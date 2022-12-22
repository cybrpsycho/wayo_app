import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wayo/features/information/providers/store_bloc/store_bloc.dart';

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
        log('$state');
        if (state is StoreLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is StoreFetched) {
          return SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1,
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
                        maxRadius: 40,
                        child: Icon(Icons.storefront_outlined),
                      ),
                    ),
                    Text(store.name),
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
