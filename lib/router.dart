import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import 'features/information/screens/discover.dart';
import 'features/information/screens/home.dart';
import 'features/information/screens/mall_info.dart';
import 'features/information/screens/menu.dart';
import 'features/information/screens/store_info.dart';
import 'features/navigation/screens/physical_map.dart';
import 'features/navigation/screens/mall_map.dart';
import 'features/content/screens/notifications.dart';
import 'features/information/screens/savedplaces_screen.dart';
import 'features/information/screens/search.dart';
import 'features/shared/widgets/custom_bottomnav.dart';
import 'splash.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'notifications',
          name: 'notifications',
          builder: (context, state) => const NotificationsScreen(),
        ),
        GoRoute(
          path: 'physical_map',
          name: 'physical_map',
          builder: (context, state) => const PhysicalMapScreen(),
        ),
        GoRoute(
          path: 'search',
          name: 'search',
          builder: (context, state) => const SearchScreen(),
        ),
        GoRoute(
          path: 'discover',
          name: 'discover',
          builder: (context, state) => const DiscoverScreen(),
        ),
        GoRoute(
          path: 'saved',
          name: 'saved',
          builder: (context, state) => const SavedPlacesScreen(),
        ),
        GoRoute(
          path: 'menu',
          name: 'menu',
          builder: (context, state) => const MenuScreen(),
        ),
        // GoRoute(
        //   path: 'mall',
        //   name: 'mall',
        //   builder: (context, state) => const MallInfoScreen(),
        // ),
        GoRoute(
          path: 'map',
          name: 'map',
          builder: (context, state) => const MallMapScreen(),
        ),
        // GoRoute(
        //   path: 'store',
        //   name: 'store',
        //   builder: (context, state) => const StoreInfoScreen(),
        // ),
      ],
    ),
  ],
  navigatorBuilder: (context, state, child) {
    final isSplash = state.location == '/splash';

    final rootLocations = ['/', '/search', '/discover', '/saved', '/menu'];

    final isRoot = rootLocations.contains(state.location);

    return Navigator(
      onPopPage: (route, result) {
        return route.didPop(result);
      },
      pages: [
        if (isSplash)
          MaterialPage(child: Scaffold(body: child))
        else if (isRoot)
          MaterialPage(
            child: Scaffold(
              body: KeyboardDismisser(child: child),
              bottomNavigationBar: const CustomBottomNav(),
            ),
          )
        else
          MaterialPage(child: Scaffold(body: KeyboardDismisser(child: child)))
      ],
    );
  },
  debugLogDiagnostics: true,
);
