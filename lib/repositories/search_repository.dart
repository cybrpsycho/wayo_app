import 'package:wayo/apis/search_api.dart';
import 'package:wayo/models/result.dart';

class SearchRepository {
  Future<List<Result>> searchForItem(String query) async {
    final results = <Result>[];

    if (query.isEmpty) return results;

    final searchApi = SearchApi();
    final data = await searchApi.searchForItem(query);

    if (data is Map && data.containsKey('hits')) {
      final hits = data['hits'];
      if (hits is List && hits.isNotEmpty) {
        for (Map<String, dynamic> element in hits) {
          results.add(Result.fromJson(element));
        }
      }
    }

    return results;
  }
}
