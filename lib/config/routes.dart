import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:keyboard_dismisser/keyboard_dismisser.dart";
import "package:wayo/models/mall.dart";
import "package:wayo/screens/discover/screen.dart";
import "package:wayo/screens/favourites/favourites_screen.dart";
import "package:wayo/screens/home/screen.dart";
import "package:wayo/screens/physical_map/screen.dart";
import "package:wayo/screens/landing/screen.dart";
import "package:wayo/screens/onboarding/screen.dart";
import "package:wayo/screens/splash/screen.dart";
import "package:wayo/screens/mall_info/screen.dart";
import "package:wayo/screens/mall_map/screen.dart";
import "package:wayo/screens/malls/screen.dart";
import "package:wayo/screens/menu/legal_screen.dart";
import "package:wayo/screens/menu/menu_screen.dart";
import "package:wayo/screens/menu/settings_screen.dart";
import "package:wayo/screens/notifications/notifications_screen.dart";
import "package:wayo/screens/search/search_screen.dart";
import "package:wayo/screens/stores/branch_screen.dart";
import "package:wayo/screens/stores/store_screen.dart";
import "package:wayo/screens/stores/stores_screen.dart";
import "package:wayo/widgets/frosted_navbar.dart";

final appRoutes = [
  ShellRoute(
      // navigatorKey: GlobalKey<NavigatorState>(),
      builder: (context, state, child) {
        return Navigator(
          onPopPage: (route, result) => route.didPop(result),
          pages: [_generatePage(state, child)],
        );
      },
      routes: [
        GoRoute(
          path: "/splash",
          name: "splash",
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: "/onboarding",
          name: "onboarding",
          builder: (context, state) => const OnboardingScreen(),
        ),
        GoRoute(
          path: "/landing",
          name: "landing",
          builder: (context, state) => const LandingScreen(),
        ),
        GoRoute(
          path: "/",
          name: "home",
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
              path: "physical_map",
              name: "physical_map",
              builder: (context, state) => const PhysicalMapScreen(),
            ),
            GoRoute(
              path: "malls",
              name: "malls",
              builder: (context, state) => const MallsScreen(),
            ),
            GoRoute(
              path: "mall/:mallId",
              name: "mall",
              builder: (context, state) {
                final mallId = state.pathParameters["mallId"] as String;
                return MallInfoScreen(mallId: mallId);
              },
              routes: [
                GoRoute(
                  path: "branch/:branchId",
                  name: "branch",
                  builder: (context, state) {
                    final mallId = state.pathParameters["mallId"] as String;
                    final branchId = state.pathParameters["branchId"] as String;
                    return BranchScreen(mallId: mallId, branchId: branchId);
                  },
                ),
                GoRoute(
                  path: "mall_map",
                  name: "mall_map",
                  builder: (context, state) {
                    final mallId = state.pathParameters["mallId"] as String;
                    final uri = state.uri;
                    final floor = uri.queryParameters["floor"];
                    final storeModelName =
                        uri.queryParameters["storeModelName"];
                    final mall = state.extra as Mall;
                    return MallMapScreen(
                      mallId: mallId,
                      mall: mall,
                      floor: floor,
                      storeName: storeModelName,
                    );
                  },
                ),
              ],
            ),
            GoRoute(
              path: "stores",
              name: "stores",
              builder: (context, state) => const StoresScreen(),
            ),
            GoRoute(
              path: "store/:storeId",
              name: "store",
              builder: (context, state) {
                final storeId = state.pathParameters["storeId"] as String;
                return StoreScreen(storeId: storeId);
              },
            ),
            GoRoute(
              path: "notifications",
              name: "notifications",
              builder: (context, state) => const NotificationsScreen(),
            ),
          ],
        ),
        GoRoute(
          path: "/search",
          name: "search",
          builder: (context, state) => const SearchScreen(),
        ),
        GoRoute(
          path: "/discover",
          name: "discover",
          builder: (context, state) => const DiscoverScreen(),
          routes: const [],
        ),
        GoRoute(
          path: "/favourites",
          name: "favourites",
          builder: (context, state) => const FavouritesScreen(),
        ),
        GoRoute(
          path: "/menu",
          name: "menu",
          builder: (context, state) => const MenuScreen(),
          routes: [
            GoRoute(
              path: "settings",
              name: "settings",
              builder: (context, state) => const SettingsScreen(),
            ),
            GoRoute(
              path: "legal",
              name: "legal",
              builder: (context, state) => const LegalScreen(),
            ),
          ],
        ),
      ]),
];

Page _generatePage(GoRouterState state, Widget child) {
  final rootLocations = [
    "/",
    "/search",
    "/favourites",
    "/discover",
    "/menu",
  ];

  final isIntro = state.uri.toString() == "/splash" ||
      state.uri.toString() == "/landing" ||
      state.uri.toString() == "/onboarding";

  final isRoot = rootLocations.contains(state.uri.toString());

  if (isIntro) return MaterialPage(child: Scaffold(body: child));

  if (isRoot) {
    return MaterialPage(
      child: Scaffold(
        extendBody: true,
        body: KeyboardDismisser(child: child),
        bottomNavigationBar: const FrostedNavBar(),
      ),
    );
  }

  return MaterialPage(
    child: Scaffold(
      body: KeyboardDismisser(child: child),
    ),
  );
}
