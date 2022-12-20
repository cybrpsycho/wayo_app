import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/mall.dart';
import '../models/store.dart';

class MallApi {
  Future<List<Mall>> getMalls() async {
    try {} on DioError catch (e) {
      log(e.message);
    }
    return [];
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
