import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wayo/models/category.dart';

class CategoryApi {
  final _ref = FirebaseFirestore.instance;

  // TODO: Add error handling
  Future<List<Category>> getCategories() async {
    final catSnapshot = await _ref.collection('categories').get();
    final subcatSnapshot = await _ref.collectionGroup('subcategories').get();
    final docs = [...catSnapshot.docs, ...subcatSnapshot.docs];

    return docs.map((doc) => Category.fromJson(doc.data())).toList();
  }
}
