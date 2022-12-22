import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton<Dio>(() {
    final dio = Dio();

    dio.options.baseUrl = 'https://us-central1-wayo-254.cloudfunctions.net/app';

    return dio;
  });
}
