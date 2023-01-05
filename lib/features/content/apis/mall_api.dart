import 'package:dio/dio.dart';
import 'package:wayo/locator.dart';

class MallApi {
  Future<List<dynamic>> getMalls() async {
    await locator.isReady<Dio>();
    final dio = locator.get<Dio>();
    final response = await dio.get('/malls');

    return response.data;
  }

  Future<dynamic> getMall(String mallId) async {
    final dio = locator.get<Dio>();
    final response = await dio.get('/malls/$mallId');

    return response.data;
  }
}
