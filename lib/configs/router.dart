import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:wayo/blocs/data_bloc/data_bloc.dart';
import 'package:wayo/screens/generic_widgets/appbar.dart';
import 'package:wayo/screens/generic_widgets/bottomnav.dart';
import 'package:wayo/screens/home_screen.dart';
import 'package:wayo/screens/mallinfo_screen.dart';
import 'package:wayo/screens/mallmap_screen.dart';
import 'package:wayo/screens/menu_screen.dart';
import 'package:wayo/screens/savedplaces_screen.dart';
import 'package:wayo/screens/search_screen.dart';
import 'package:wayo/screens/splash_screen.dart';

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
          path: 'search',
          name: 'search',
          builder: (context, state) => const SearchScreen(),
        ),
        GoRoute(
          path: 'discover',
          name: 'discover',
          builder: (context, state) => const SearchScreen(),
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
          routes: [
            GoRoute(
              path: 'map',
              name: 'map',
              builder: (context, state) => const MallMapScreen(),
            ),
          ],
        ),
      ],
    ),
    // GoRoute(
    //   path: '/malls',
    //   name: 'malls',
    //   builder: (context, state) => const MallsScreen(),
    //   routes: [
    //     GoRoute(
    //       path: ':mallId',
    //       name: 'mall',
    //       builder: (context, state) {
    //         final mallId = state.params['mallId'] as String;
    //         return MallDetailsScreen(mallId: mallId);
    //       },
    //       routes: [
    //         GoRoute(
    //           path: 'categories/:categoryId',
    //           name: 'subcategories',
    //           builder: (context, state) {
    //             final categoryId = state.params['categoryId'] as String;
    //             final DataState = state.extra as DataState;
    //             return SubcategoriesScreen(
    //               categoryId: categoryId,
    //               state: DataState,
    //             );
    //           },
    //         ),
    //       ],
    //     ),
    //   ],
    // ),
    // GoRoute(
    //   path: '/stores',
    //   name: 'stores',
    //   builder: (context, state) {
    //     final subcategory = state.queryParams['subcategory'];
    //     final stores = state.extra as List<Store>?;
    //     return StoresScreen(subcategory: subcategory, stores: stores);
    //   },
    //   routes: [
    //     GoRoute(
    //       path: ':storeId/branches/:branchId',
    //       name: 'store',
    //       builder: (context, state) {
    //         final storeId = state.params['storeId'] as String;
    //         final branchId = state.params['branchId'] as String;
    //         return StoreDetailsScreen(storeId: storeId, branchId: branchId);
    //       },
    //       routes: [
    //         GoRoute(
    //           path: 'directions',
    //           name: 'directions',
    //           builder: (context, state) {
    //             final mallId = state.queryParams['mallId'] as String;
    //             final branchId = state.params['branchId'] as String;
    //             return StoreDirectionsScreen(
    //               mallId: mallId,
    //               branchId: branchId,
    //             );
    //           },
    //         ),
    //       ],
    //     ),
    //   ],
    // )
  ],
  navigatorBuilder: (context, state, child) {
    return Navigator(
      onPopPage: (route, result) {
        if (context.canPop()) return false;
        return route.didPop(result);
      },
      pages: [
        MaterialPage(
          child: BlocProvider(
            create: (context) => DataBloc(),
            child: SafeArea(
              child: Scaffold(
                body: KeyboardDismisser(child: child),
                bottomNavigationBar: const GenericBottomNav(),
              ),
            ),
          ),
        ),
      ],
    );
  },
  debugLogDiagnostics: true,
);
