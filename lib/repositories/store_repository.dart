import 'package:wayo/apis/store_api.dart';
import 'package:wayo/locator.dart';
import 'package:wayo/models/store.dart';

class StoreRepository {
  Future<Store?> getStore(String storeId, String branchId) async {
    final storeApi = locator.get<StoreApi>();
    return await storeApi.getStore(storeId);
  }

  Future<List<Store>> getStores() async {
    final storeApi = locator.get<StoreApi>();
    return await storeApi.getStores();
  }
}
