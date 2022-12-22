import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:wayo/locator.dart';

import '../models/mall.dart';
import '../models/store.dart';

class MallApi {
  Future<List<Mall>> getMalls() async {
    final malls = <Mall>[];
    try {
      final dio = locator.get<Dio>();
      final response = await dio.get('/malls');
      if (response.statusCode == 200) {
        for (Map<String, dynamic> element in response.data) {
          malls.add(Mall.fromJson(element));
        }
        return malls;
      }
    } on DioError catch (e) {
      log(e.message);
    }
    return malls;
  }

  Future<List<Store>> getStoresInMall(String mallId) async {
    try {} on DioError catch (e) {
      log(e.message);
    }
    return [];
  }

  Future<Mall?> getMall(String mallId) async {
    try {} on DioError catch (e) {
      log(e.message);
    }
    return null;
  }
}
