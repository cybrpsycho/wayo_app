import 'package:flutter/material.dart';

import '../widgets/advert_carousel.dart';
import '../widgets/malls_preview_list.dart';
import '../widgets/map_preview.dart';
import '../widgets/stores_preview_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(title: Text('WAYO'), pinned: true),
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          sliver: SliverToBoxAdapter(child: Text('Malls Around Me')),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          sliver: SliverToBoxAdapter(child: MapPreview()),
        ),
        SliverToBoxAdapter(
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            title: const Text('Discover Malls'),
            trailing: TextButton(
              onPressed: () {},
              child: const Text('See More'),
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.only(bottom: 24),
          sliver: SliverToBoxAdapter(child: MallsPreviewList()),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 12),
          sliver: SliverToBoxAdapter(child: AdvertCarousel()),
        ),
        SliverToBoxAdapter(
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            title: const Text('Discover Stores'),
            trailing: TextButton(
              onPressed: () {},
              child: const Text('See More'),
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          sliver: StoresPreviewGrid(),
        ),
      ],
    );
  }
}
