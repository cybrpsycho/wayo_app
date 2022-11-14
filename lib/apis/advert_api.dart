import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wayo/models/advert.dart';

class AdvertApi {
  final _ref = FirebaseFirestore.instance;

  // TODO: Add error handling
  Future<List<Advert>> getImageAdverts() async {
    final List<Advert> ads = [];
    final snapshot = await _ref.collection('adverts').doc('images').get();
    final data = snapshot.data();

    if (data != null) {
      if (data.containsKey('banner')) {
        for (Map<String, dynamic> ad in data['banner']) {
          ads.add(Advert.fromJson(ad));
        }
      }
      if (data.containsKey('interstitial')) {
        for (Map<String, dynamic> ad in data['interstitial']) {
          ads.add(Advert.fromJson(ad));
        }
      }
      if (data.containsKey('leaderboard')) {
        for (Map<String, dynamic> ad in data['leaderboard']) {
          ads.add(Advert.fromJson(ad));
        }
      }
      if (data.containsKey('square')) {
        for (Map<String, dynamic> ad in data['square']) {
          ads.add(Advert.fromJson(ad));
        }
      }
    }

    ads.shuffle();

    return ads;
  }

  Future<List<Advert>> getVideoAdverts() async {
    final List<Advert> ads = [];
    final snapshot = await _ref.collection('adverts').doc('videos').get();
    final data = snapshot.data();

    if (data != null) {
      if (data.containsKey('long')) {
        for (Map<String, dynamic> ad in data['long']) {
          ads.add(Advert.fromJson(ad));
        }
      }
    }

    ads.shuffle();

    return ads;
  }
}
