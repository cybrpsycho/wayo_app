import 'package:wayo/features/information/apis/store_api.dart';
import '../models/store.dart';

class StoreRepository {
  final _api = StoreApi();

  Future<List<Store>> getStores() async {
    return await _api.getStores();
  }

  Future<Store?> getStore(String storeId, String branchId) async {
    return await _api.getStore(storeId);
  }
}
