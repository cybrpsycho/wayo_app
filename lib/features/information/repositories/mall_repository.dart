import 'package:wayo/features/information/apis/mall_api.dart';

import '../models/mall.dart';
import '../models/store.dart';

class MallRepository {
  final _api = MallApi();

  Future<List<Mall>> getMalls() async {
    return await _api.getMalls();
  }

  Future<Mall?> getMall(String mallId) async {
    return await _api.getMall(mallId);
  }

  Future<List<Store>> getStoresInMall(String mallId) async {
    return await _api.getStoresInMall(mallId);
  }
}
