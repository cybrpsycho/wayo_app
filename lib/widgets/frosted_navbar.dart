import "dart:ui";

import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

class FrostedNavBar extends StatefulWidget {
  const FrostedNavBar({super.key});

  @override
  State<FrostedNavBar> createState() => _FrostedNavBarState();
}

class _FrostedNavBarState extends State<FrostedNavBar> {
  final _destinations = ["home", "discover", "search", "favourites", "menu"];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: NavigationBar(
          elevation: 0,
          backgroundColor:
              Theme.of(context).colorScheme.surface.withOpacity(0.3),
          height: kToolbarHeight + 8,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_rounded),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(Icons.explore_rounded),
              label: "Discover",
            ),
            NavigationDestination(
              icon: Icon(Icons.search_rounded),
              label: "Search",
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite_rounded),
              label: "Favourites",
            ),
            NavigationDestination(
              icon: Icon(Icons.menu_rounded),
              label: "Menu",
            ),
          ],
          selectedIndex: _currentIndex,
          onDestinationSelected: (value) {
            setState(() {
              if (_currentIndex == value) return;
              _currentIndex = value;
              context.goNamed(_destinations[value]);
            });
          },
        ),
      ),
    );
  }
}
