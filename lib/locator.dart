import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';

import 'blocs/map_bloc/map_bloc.dart';
import 'blocs/settings_bloc/settings_bloc.dart';

final locator = GetIt.instance;

void setupServiceLocator() {
  locator.registerLazySingleton<SettingsBloc>(() {
    return SettingsBloc()..add(InitializeSettings());
  });
  locator.registerLazySingleton<MapBloc>(() {
    return MapBloc()
      ..add(InitializeMap())
      ..add(GetCurrentLocation());
  });
  locator.registerLazySingletonAsync<Dio>(() async {
    final cacheDir = await getTemporaryDirectory();

    final dio = Dio();

    const baseUrl = 'https://us-central1-wayo-254.cloudfunctions.net/live';
    final baseOptions = BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'x-server-api-key': '6Vapm0fPAYw0GXH0NpsNdGySgTBleFwXihGf',
      },
    );

    final cacheOptions = CacheOptions(
      store: HiveCacheStore(cacheDir.path),
      maxStale: const Duration(days: 1),
      policy: CachePolicy.forceCache,
    );

    dio.options = baseOptions;
    // dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));

    return dio;
  });
}
