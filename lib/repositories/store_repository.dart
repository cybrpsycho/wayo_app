import "package:wayo/apis/mock_api.dart";
import "package:wayo/models/branch.dart";
import "package:wayo/models/store.dart";

class StoreRepository {
  Future<List<Store>> getStores() async {
    final stores = <Store>[];
    final data = MockApi.stores;

    for (var element in data) {
      stores.add(Store.fromJson(element));
    }

    return stores;
  }

  Future<Store> getStore(String storeId) async {
    final data = MockApi.stores.firstWhere((element) {
      return element["id"] == int.parse(storeId);
    });

    return Store.fromJson(data);
  }

  Future<List<Branch>> getBranches(String mallId) async {
    final stores = <Branch>[];

    final data = MockApi.branches.where((element) {
      return element["mall_id"] == int.parse(mallId);
    });

    for (var element in data) {
      stores.add(Branch.fromJson(element));
    }

    return stores;
  }

  Future<Branch> getBranch(String branchId) async {
    final data = MockApi.branches.firstWhere((element) {
      return element["id"] == int.parse(branchId);
    });

    return Branch.fromJson(data);
  }
}
