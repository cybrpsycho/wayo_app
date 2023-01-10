import 'package:wayo/features/content/apis/category_api.dart';
import 'package:wayo/features/content/apis/store_api.dart';
import 'package:wayo/features/content/models/category.dart';
import '../models/store.dart';

class StoreRepository {
  Future<List<Store>> getStores() async {
    final stores = <Store>[];
    final storeApi = StoreApi();
    final data = await storeApi.getStores();

    for (var element in data['data']) {
      stores.add(Store.fromJson(element));
    }

    return stores;
  }

  Future<List<Category>> getCategories() async {
    final categories = <Category>[];
    final categoryApi = CategoryApi();
    final data = await categoryApi.getCategories();

    for (var element in data['data']) {
      categories.add(Category.fromJson(element));
    }

    return categories;
  }

  Future<Store?> getStore(String storeId) async {
    final storeApi = StoreApi();
    final data = await storeApi.getStore(storeId);

    return Store.fromJson(data);
  }
}
