import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:wayo/locator.dart';

import '../models/store.dart';

class StoreApi {
  Future<List<Store>> getStores() async {
    final malls = <Store>[];
    try {
      final dio = locator.get<Dio>();
      final response = await dio.get('/stores');
      if (response.statusCode == 200) {
        print(response.data);
        for (Map<String, dynamic> element in response.data) {
          malls.add(Store.fromJson(element));
        }
        return malls;
      }
    } on DioError catch (e) {
      log(e.message);
    }
    return malls;
  }

  Future<Store?> getStore(String mallId) async {
    try {} on DioError catch (e) {
      log(e.message);
    }
    return null;
  }
}
