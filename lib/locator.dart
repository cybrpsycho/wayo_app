import 'package:get_it/get_it.dart';
import 'package:wayo/apis/advert_api.dart';
import 'package:wayo/apis/category_api.dart';
import 'package:wayo/apis/mall_api.dart';
import 'package:wayo/apis/store_api.dart';
import 'package:wayo/repositories/mall_repository.dart';
import 'package:wayo/repositories/map_repository.dart';
import 'package:wayo/repositories/settings_repository.dart';
import 'package:wayo/repositories/store_repository.dart';
import 'package:wayo/services/location_service.dart';
import 'package:wayo/services/notification_service.dart';
import 'package:wayo/services/permissions_service.dart';
import 'package:wayo/services/cache_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  // SERVICES
  locator.registerLazySingleton<PermissionsService>(() => PermissionsService());
  locator.registerLazySingleton<LocationService>(() => LocationService());
  locator.registerLazySingleton<CacheService>(() => CacheService());
  locator
      .registerLazySingleton<NotificationService>(() => NotificationService());
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
