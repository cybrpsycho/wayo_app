import 'package:dio/dio.dart';

class SearchApi {
  Future<dynamic> searchForItem(String query) async {
    final dio = Dio();

    dio.options.headers = {
      'Content-Type': 'application/json',
      'X-TYPESENSE-API-KEY': 'txrKb54EtuRQD4OtpN41gPH7hmVFyNeW'
    };

    const hostName = 'wayo.site';
    const path = '/collections/data/documents/search';
    final queryParams = {'q': query, 'query_by': 'name'};

    final uri = Uri.https(hostName, path, queryParams);

    final response = await dio.get(uri.toString());

    return response.data;
  }
}
