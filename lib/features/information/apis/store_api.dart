import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/store.dart';

class StoreApi {
  Future<List<Store>> getStores() async {
    try {} on DioError catch (e) {
      log(e.message);
    }
    return [];
  }

  Future<Store?> getStore(String mallId) async {
    try {} on DioError catch (e) {
      log(e.message);
    }
    return null;
  }
}
