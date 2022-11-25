import 'package:json_annotation/json_annotation.dart';

part 'store.g.dart';

@JsonSerializable(explicitToJson: true)
class Store {
  final String id, name, category, subcategory, hours, phone;
  final String? logo, description, email, objectName, objectImage;
  final List<String> floors;

  const Store({
    required this.id,
    required this.name,
    required this.category,
    required this.subcategory,
    required this.hours,
    required this.phone,
    required this.floors,
    this.logo,
    this.description,
    this.email,
    this.objectName,
    this.objectImage,
  });

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  Map<String, dynamic> toJson() => _$StoreToJson(this);
}
