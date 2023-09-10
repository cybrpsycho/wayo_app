import "package:json_annotation/json_annotation.dart";

part "store.g.dart";

@JsonSerializable(fieldRename: FieldRename.snake)
class Store {
  final int id;
  final String name, email, logoUrl, featureImage;
  final String? description;
  final List<String> phoneNumbers;

  const Store({
    required this.id,
    required this.name,
    required this.email,
    required this.logoUrl,
    required this.featureImage,
    this.description,
    this.phoneNumbers = const [],
  });

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  Map<String, dynamic> toJson() => _$StoreToJson(this);
}
