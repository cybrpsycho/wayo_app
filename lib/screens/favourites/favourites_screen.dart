import "package:flutter/material.dart";
import "package:sliver_tools/sliver_tools.dart";
import "package:wayo/widgets/preview_tile.dart";

import "package:wayo/widgets/frosted_appbar.dart";

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverPinnedHeader(
              child: FrostedAppBar(
                bottom: Theme(
                  data: Theme.of(context).copyWith(
                      splashFactory: NoSplash.splashFactory,
                      tabBarTheme: Theme.of(context)
                          .tabBarTheme
                          .copyWith(indicatorSize: TabBarIndicatorSize.tab)),
                  child: const TabBar(
                    tabs: [
                      Tab(text: "Malls"),
                      Tab(text: "Stores"),
                    ],
                  ),
                ),
              ),
            ),
            SliverPinnedHeader(
              child: Container(
                alignment: Alignment.center,
                color: Theme.of(context).colorScheme.primaryContainer,
                child: Text("work in progress".toUpperCase()),
              ),
            ),
          ];
        },
        body: TabBarView(
          children: [
            ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  leading: const PreviewTile(),
                  title: const Text("Favorite Mall"),
                  onTap: () {},
                );
              },
              itemCount: 2,
            ),
            ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  leading: const PreviewTile(),
                  title: const Text("Favorite Store"),
                  onTap: () {},
                );
              },
              itemCount: 4,
            ),
          ],
        ),
      ),
    );
  }
}
