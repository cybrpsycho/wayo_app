import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wayo/features/content/providers/mall_bloc/mall_bloc.dart';
import 'package:wayo/features/content/providers/store_bloc/store_bloc.dart';

import '../widgets/page_header_delegate.dart';

class MallInfoScreen extends StatefulWidget {
  final String mallId;
  const MallInfoScreen({super.key, required this.mallId});

  @override
  State<MallInfoScreen> createState() => _MallInfoScreenState();
}

class _MallInfoScreenState extends State<MallInfoScreen> {
  late final StoreBloc _storeBloc;

  @override
  void initState() {
    super.initState();
    _storeBloc = StoreBloc()..add(GetStoresInMall(mallId: widget.mallId));
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [MallInfoHeader(mallId: widget.mallId)];
      },
      body: BlocBuilder<StoreBloc, StoreState>(
        bloc: _storeBloc,
        builder: (context, state) {
          if (state is MallLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is StoresFetched) {
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text('STORES'),
                ),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    final store = state.stores[index];
                    return InkWell(
                      onTap: () {
                        context.goNamed('store');
                      },
                      child: Column(
                        children: [
                          Expanded(
                            child: CircleAvatar(
                              radius: double.infinity,
                              foregroundImage: store.logoUrl != null
                                  ? CachedNetworkImageProvider(store.logoUrl!)
                                  : null,
                              backgroundColor: Colors.grey[300],
                              child: store.logoUrl == null
                                  ? const Icon(Icons.shopping_bag_rounded)
                                  : null,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(store.name),
                        ],
                      ),
                    );
                  },
                  itemCount: state.stores.length,
                ),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text('OFFERS'),
                ),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    return Container(color: Colors.blue);
                  },
                  itemCount: 5,
                ),
              ],
            );
          }
          if (state is MallError) {
            return Container(
              height: 76,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(24),
              child: const Text('App run into an error'),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
