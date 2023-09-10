import "package:wayo/apis/mock_api.dart";
import "package:wayo/models/mall.dart";
import "package:wayo/models/result.dart";
import "package:wayo/models/store.dart";

class SearchRepository {
  Future<List<Result>> searchForItem(String query) async {
    final results = <Result>[];

    for (var element in MockApi.malls) {
      final mall = Mall.fromJson(element);
      final regex = RegExp(r"" + query + "", caseSensitive: false);
      if (regex.hasMatch(mall.name)) {
        final result = Result(hit: mall.name, type: ResultType.mall);
        results.add(result);
      }
    }

    for (var element in MockApi.stores) {
      final store = Store.fromJson(element);
      final regex = RegExp(r"" + query + "", caseSensitive: false);
      if (regex.hasMatch(store.name)) {
        final result = Result(hit: store.name, type: ResultType.store);
        results.add(result);
      }
    }

    return results;
  }
}
