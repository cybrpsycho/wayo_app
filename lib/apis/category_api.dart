import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wayo/models/category.dart';

class CategoryApi {
  final _ref = FirebaseFirestore.instance;

  // TODO: Add error handling
  Future<List<Category>> getCategories() async {
    final List<Category> categories = [];
    final catSnapshot =
        await _ref.collection('categories').orderBy('name').get();
    // final subcatSnapshot = await _ref.collectionGroup('subcategories').get();
    // final docs = [...catSnapshot.docs, ...subcatSnapshot.docs];
    for (QueryDocumentSnapshot<Map<String, dynamic>> doc in catSnapshot.docs) {
      categories.add(Category.fromJson(doc.data()));
    }

    return categories;
  }
}
