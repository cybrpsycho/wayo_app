import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wayo/models/mall.dart';
import 'package:wayo/models/store.dart';

class MallApi {
  final _ref = FirebaseFirestore.instance.collection('malls');

  // TODO: Add error handling
  Future<List<Mall>> getMalls() async {
    final snapshot = await _ref.get();
    final docs = snapshot.docs;

    return docs.map((doc) => Mall.fromJson(doc.data())).toList();
  }

  Future<List<Store>> getStores(String mallId) async {
    final snapshot = await _ref.doc(mallId).collection('stores').get();
    final docs = snapshot.docs;

    return docs.map((doc) => Store.fromJson(doc.data())).toList();
  }

  Future<Mall?> getMall(String mallId) async {
    final snapshot = await _ref.doc(mallId).get();

    if (snapshot.exists) {
      return Mall.fromJson(snapshot.data()!);
    }

    return null;
  }
}
