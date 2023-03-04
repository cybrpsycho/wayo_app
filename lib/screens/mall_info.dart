import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:text_scroll/text_scroll.dart';
import 'package:wayo/blocs/mall_bloc/mall_bloc.dart';
import 'package:wayo/blocs/store_bloc/store_bloc.dart';
import 'package:wayo/widgets/preview_tile.dart';

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
        return [MallInfoAppbar(mallId: widget.mallId)];
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
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    final store = state.stores[index];
                    return PreviewTile(
                      imageUrl: store.logoUrl,
                      placeholderName: store.name,
                      onTap: () {
                        context.goNamed(
                          'StoreInfo',
                          params: {'storeId': store.id},
                        );
                      },
                    );
                  },
                  itemCount: state.stores.length,
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

class MallInfoAppbar extends StatefulWidget {
  final String mallId;

  const MallInfoAppbar({
    super.key,
    required this.mallId,
  });

  @override
  State<MallInfoAppbar> createState() => _MallInfoAppbarState();
}

class _MallInfoAppbarState extends State<MallInfoAppbar> {
  late final MallBloc _mallBloc;

  @override
  void initState() {
    super.initState();
    _mallBloc = MallBloc()..add(GetMall(mallId: widget.mallId));
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.white,
          color: Colors.white,
        ),
        textTheme: Theme.of(context).textTheme.apply(
              displayColor: Colors.white,
              bodyColor: Colors.white,
            ),
        iconTheme: const IconThemeData(color: Colors.white),
        primaryIconTheme: const IconThemeData(color: Colors.white),
      ),
      child: SliverAppBar(
        title: const Text('Mall Info'),
        pinned: true,
        actions: [
          AspectRatio(
            aspectRatio: 1,
            child: IconButton(
              tooltip: 'Notifications',
              onPressed: () => context.goNamed('notifications'),
              icon: const Icon(Icons.notifications_rounded),
            ),
          ),
        ],
        expandedHeight: 240,
        flexibleSpace: Stack(
          children: [
            BlocBuilder<MallBloc, MallState>(
              bloc: _mallBloc,
              builder: (context, state) {
                if (state is MallFetched && state.mall.imageUrls.isNotEmpty) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 1,
                      height: double.infinity,
                      autoPlayInterval: state.mall.imageUrls.length == 1
                          ? const Duration(seconds: 0)
                          : const Duration(seconds: 10),
                      autoPlayAnimationDuration: const Duration(seconds: 5),
                    ),
                    items: state.mall.imageUrls.map((url) {
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(url),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }).toList(),
                  );
                }
                return Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/placeholder.jpg'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                );
              },
            ),
            Container(color: Colors.black.withOpacity(0.6)),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(72),
          child: BlocBuilder<MallBloc, MallState>(
            bloc: _mallBloc,
            builder: (context, state) {
              if (state is MallFetched) {
                return ListTile(
                  isThreeLine: true,
                  title: Text(state.mall.name),
                  subtitle: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 16,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 8),
                          TextScroll(state.mall.address),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.watch_later_outlined,
                            size: 16,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 8),
                          Text('${state.mall.opens} - ${state.mall.closes}'),
                        ],
                      ),
                    ],
                  ),
                  trailing: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.3),
                    ),
                    child: IconButton(
                      onPressed: () {
                        context.goNamed('MallMap', params: {
                          'modelUrl': state.mall.modelUrl,
                        });
                      },
                      icon: const Icon(
                        Icons.directions_walk_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
