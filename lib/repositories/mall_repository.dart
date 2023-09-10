import "package:wayo/apis/mock_api.dart";
import "package:wayo/models/mall.dart";

class MallRepository {
  Future<List<Mall>> getMalls({String? storeId}) async {
    final malls = <Mall>[];

    final data = MockApi.malls;

    if (storeId != null) {
      final branches = MockApi.branches.where((element) {
        return element["company_id"] == int.parse(storeId);
      });

      for (var branch in branches) {
        final mall = await getMall('${branch['mall_id']}');
        malls.add(mall);
      }

      return malls;
    }

    for (var element in data) {
      malls.add(Mall.fromJson(element));
    }

    return malls;
  }

  Future<Mall> getMall(String mallId) async {
    final data = MockApi.malls.firstWhere((element) {
      return element["id"] == int.parse(mallId);
    });

    return Mall.fromJson(data);
  }
}
