import 'package:get_it/get_it.dart';

import 'apis/advert_api.dart';
import 'apis/category_api.dart';
import 'apis/mall_api.dart';
import 'apis/store_api.dart';

import 'repositories/mall_repository.dart';
import 'repositories/map_repository.dart';
import 'repositories/settings_repository.dart';
import 'repositories/store_repository.dart';

import 'services/cache_service.dart';
import 'services/location_service.dart';
import 'services/permissions_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  // SERVICES
  locator.registerLazySingleton<PermissionsService>(() => PermissionsService());
  locator.registerLazySingleton<LocationService>(() => LocationService());
  locator.registerLazySingleton<CacheService>(() => CacheService());
  // REPOSITORIES
  locator
      .registerLazySingleton<SettingsReposistory>(() => SettingsReposistory());
  locator.registerLazySingleton<MapRepository>(() => MapRepository());
  locator.registerLazySingleton<MallRepository>(() => MallRepository());
  locator.registerLazySingleton<StoreRepository>(() => StoreRepository());
  // locator.registerLazySingleton<AdvertRepository>(() => AdvertRepository());
  // APIS
  locator.registerLazySingleton<MallApi>(() => MallApi());
  locator.registerLazySingleton<StoreApi>(() => StoreApi());
  locator.registerLazySingleton<CategoryApi>(() => CategoryApi());
  locator.registerLazySingleton<AdvertApi>(() => AdvertApi());
}
