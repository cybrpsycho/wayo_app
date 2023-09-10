import "package:json_annotation/json_annotation.dart";
import "package:wayo/models/hours.dart";

part "branch.g.dart";

@JsonSerializable(fieldRename: FieldRename.snake)
class Branch {
  final int id, categoryId;
  final String name, floor;
  final String? description, email, logoUrl, storeModelName;
  final Hours hours;
  final List<String> phoneNumbers, assetUrls;

  const Branch({
    required this.id,
    required this.name,
    required this.phoneNumbers,
    required this.categoryId,
    required this.hours,
    required this.floor,
    this.storeModelName,
    this.description,
    this.email,
    this.logoUrl,
    this.assetUrls = const [],
  });

  factory Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);

  Map<String, dynamic> toJson() => _$BranchToJson(this);
}
