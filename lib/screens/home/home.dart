import 'package:flutter/material.dart';

import '../components/appbar_wrapper.dart';
import 'widgets/advert_carousel.dart';
import 'widgets/malls_preview_list.dart';
import 'widgets/physical_map_preview.dart';
import 'widgets/stores_preview_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppbarWrapper(
      appbarTitle: const Text('WAYO'),
      body: CustomScrollView(
        slivers: [
          const SliverPadding(
            padding: EdgeInsets.all(24),
            sliver: SliverToBoxAdapter(child: Text('Malls Around Me')),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverToBoxAdapter(child: PhysicalMapPreview()),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 16),
            sliver: SliverToBoxAdapter(child: MallsPreviewList()),
          ),
          const SliverPadding(
            padding: EdgeInsets.all(24),
            sliver: SliverToBoxAdapter(child: Text('Advertisements')),
          ),
          const SliverToBoxAdapter(child: AdvertCarousel()),
          SliverPadding(
            padding: const EdgeInsets.all(24),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  const Text('Discover Stores'),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text('See More'),
                  )
                ],
              ),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            sliver: StoresPreviewGrid(),
          ),
        ],
      ),
    );
  }
}
