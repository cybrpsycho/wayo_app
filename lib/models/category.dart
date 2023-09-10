import "package:json_annotation/json_annotation.dart";

part "category.g.dart";

@JsonSerializable(fieldRename: FieldRename.snake)
class Category {
  final int id;
  final String name;
  final String? description, imageUrl;
  final List<Category> subcategories;

  const Category({
    required this.id,
    required this.name,
    this.description,
    this.imageUrl,
    this.subcategories = const [],
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
