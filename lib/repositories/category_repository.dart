import "package:wayo/apis/mock_api.dart";
import "package:wayo/models/category.dart";

class CategoryRepository {
  Future<List<Category>> getCategories() async {
    final categories = <Category>[];
    final data = MockApi.categories;

    for (var element in data) {
      categories.add(Category.fromJson(element));
    }

    return categories;
  }
}
