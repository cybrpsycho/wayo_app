import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../screens/components/custom_bottomnav.dart';
import '../screens/discover_screen.dart';
import '../screens/home/home.dart';
import '../screens/home/physical_map.dart';
import '../screens/mall/mall_info.dart';
import '../screens/mall/mall_map.dart';
import '../screens/menu/menu.dart';
import '../screens/notifications/notifications.dart';
import '../screens/savedplaces_screen.dart';
import '../screens/search/search.dart';
import '../screens/splash/splash.dart';
import '../screens/mall/store_info.dart';

final GoRouter router = GoRouter(
  initialLocation: '/splash',
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
        GoRoute(
          path: 'mall',
          name: 'mall',
          builder: (context, state) => const MallInfoScreen(),
        ),
        GoRoute(
          path: 'map',
          name: 'map',
          builder: (context, state) => const MallMapScreen(),
        ),
        GoRoute(
          path: 'store',
          name: 'store',
          builder: (context, state) => const StoreInfoScreen(),
        ),
      ],
    ),
  ],
  navigatorBuilder: (context, state, child) {
    final isSplash = state.location == '/splash';
    final isRoot = state.location == '/' ||
        state.location == '/search' ||
        state.location == '/discover' ||
        state.location == '/saved' ||
        state.location == '/menu';

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
