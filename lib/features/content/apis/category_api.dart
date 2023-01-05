import 'package:dio/dio.dart';
import 'package:wayo/locator.dart';

class CategoryApi {
  Future<List<dynamic>> getCategories() async {
    final dio = locator.get<Dio>();
    final response = await dio.get('/categories');

    return response.data;
  }
}
