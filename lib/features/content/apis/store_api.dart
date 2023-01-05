import 'package:dio/dio.dart';
import 'package:wayo/locator.dart';

class StoreApi {
  Future<List<dynamic>> getStores() async {
    await locator.isReady<Dio>();
    final dio = locator.get<Dio>();
    final response = await dio.get('/stores');

    return response.data;
  }

  Future<dynamic> getStore(String storeId) async {
    final dio = locator.get<Dio>();
    final response = await dio.get('/stores/$storeId');

    return response.data;
  }
}
