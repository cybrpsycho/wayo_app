import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/category.dart';

class CategoryApi {
  Future<List<Category>> getCategories() async {
    try {} on DioError catch (e) {
      log(e.message);
    }
    return [];
  }
}
