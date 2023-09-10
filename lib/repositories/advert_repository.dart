import "package:wayo/apis/mock_api.dart";
import "package:wayo/models/advert.dart";

class AdvertRepository {
  Future<Advert> getAdvert(String type, {int? index}) async {
    // FIXME: remove index from function
    if (index != null) {
      return Advert.fromJson(MockApi.adverts[index]);
    }

    final data = MockApi.adverts.firstWhere((element) {
      return element["type"] == type;
    });

    return Advert.fromJson(data);
  }
}
