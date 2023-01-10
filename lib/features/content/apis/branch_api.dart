import 'package:dio/dio.dart';
import 'package:wayo/locator.dart';

class BranchApi {
  Future<dynamic> getBranches() async {
    final dio = locator.get<Dio>();
    final response = await dio.get('/branches');

    return response.data;
  }

  Future<dynamic> getBranch(String branchId) async {
    final dio = locator.get<Dio>();
    final response = await dio.get('/branches/$branchId');

    return response.data;
  }
}
