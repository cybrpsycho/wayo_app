import "package:dio/dio.dart";
import "package:dio_cache_interceptor/dio_cache_interceptor.dart";
import "package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart";
import "package:get_it/get_it.dart";
import "package:path_provider/path_provider.dart";
import "package:wayo/blocs/app_bloc/app_bloc.dart";

void setupServiceLocators() {
  GetIt.I.registerLazySingleton<AppBloc>(() => AppBloc());

  GetIt.I.registerLazySingleton<Dio>(() {
    const baseUrl = "https://wayo.site";

    final baseOptions = BaseOptions(baseUrl: baseUrl);
    final dio = Dio(baseOptions);

    return dio;
  });

  GetIt.I.registerLazySingletonAsync<DioCacheInterceptor>(() async {
    final cacheDir = await getTemporaryDirectory();

    final cacheOptions = CacheOptions(
      store: HiveCacheStore(cacheDir.path),
      maxStale: const Duration(days: 1),
      policy: CachePolicy.forceCache,
    );

    return DioCacheInterceptor(options: cacheOptions);
  });
}
