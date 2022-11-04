import 'package:wayo/apis/category_api.dart';
import 'package:wayo/apis/mall_api.dart';
import 'package:wayo/locator.dart';
import 'package:wayo/models/category.dart';
import 'package:wayo/models/mall.dart';
import 'package:wayo/models/store.dart';

class MallRepository {
  Future<List<Mall>> getMalls() async {
    final api = locator.get<MallApi>();
    return await api.getMalls();
  }

  Future<Mall?> getMall(String mallId) async {
    final mallApi = locator.get<MallApi>();
    return await mallApi.getMall(mallId);
  }

  Future<List<Store>> getStoresInMall(String mallId) async {
    final mallApi = locator.get<MallApi>();
    return await mallApi.getStores(mallId);
  }

  Future<List<Category>> getCategories() async {
    final api = locator.get<CategoryApi>();
    return await api.getCategories();
  }
}
