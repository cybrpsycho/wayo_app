import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wayo/models/store.dart';

class StoreApi {
  final _ref = FirebaseFirestore.instance.collectionGroup('stores');
  final int _limit = 20;
  int _page = 0;

  // TODO: Add error handling
  Future<List<Store>> getStores() async {
    final snapshot = await _ref.get();
    final docs = snapshot.docs;
    _page++;

    return docs.map((doc) => Store.fromJson(doc.data())).toList();
  }

  Future<Store?> getStore(String storeId) async {
    final snapshot = await _ref.where('id', isEqualTo: storeId).get();

    if (snapshot.docs.first.exists) {
      return Store.fromJson(snapshot.docs.first.data());
    }

    return null;
  }
}
