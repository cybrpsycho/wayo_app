import 'package:json_annotation/json_annotation.dart';

part 'store.g.dart';

@JsonSerializable(explicitToJson: true)
class Store {
  final String id, name, categoryId;
  final String? email, logoUrl, description;
  final List<String> phoneNumbers, subcategoryIds;

  const Store({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.subcategoryIds,
    required this.phoneNumbers,
    this.email,
    this.logoUrl,
    this.description,
  });

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  Map<String, dynamic> toJson() => _$StoreToJson(this);
}
