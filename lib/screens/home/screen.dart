import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:sliver_tools/sliver_tools.dart";
import "package:wayo/screens/home/widgets/malls_preview_list.dart";
import "package:wayo/screens/home/widgets/stores_preview_grid.dart";
import "package:wayo/widgets/frosted_appbar.dart";

import "package:wayo/screens/home/widgets/map_view.dart";

import "widgets/advert_carousel.dart";
import "widgets/banner_advert.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [const SliverPinnedHeader(child: FrostedAppBar())];
      },
      body: ListView(
        children: [
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                const MapView(isInteractive: false),
                InkWell(
                  onTap: () {
                    context.goNamed("physical_map");
                  },
                  child: const SizedBox.expand(),
                )
              ],
            ),
          ),
          const SizedBox(height: 12),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 24),
            title: const Text("Discover Malls"),
            trailing: TextButton(
              onPressed: () => context.goNamed("malls"),
              child: const Text("See All"),
            ),
          ),
          const SizedBox(height: 12),
          const SizedBox(
            height: 80,
            child: MallsPreviewList(),
          ),
          const SizedBox(height: 36),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: AdvertCarousel(),
          ),
          const SizedBox(height: 12),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 24),
            title: const Text("Discover Stores"),
            trailing: TextButton(
              onPressed: () => context.goNamed("Stores"),
              child: const Text("See All"),
            ),
          ),
          const SizedBox(height: 12),
          const StoresPreviewGrid(),
          const SizedBox(height: 36),
          const BannerAdvert(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
