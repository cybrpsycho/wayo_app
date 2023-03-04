import 'package:dio/dio.dart';
import 'package:wayo/locator.dart';

class CategoryApi {
  Future<dynamic> getCategories() async {
    final dio = locator.get<Dio>();
    final response = await dio.get('/categories');

    return response.data;
  }
}
