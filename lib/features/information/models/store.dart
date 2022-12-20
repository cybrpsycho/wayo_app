import 'package:json_annotation/json_annotation.dart';

part 'store.g.dart';

@JsonSerializable(explicitToJson: true)
class Store {
  final String id, name, category, subcategory, phone, email;
  final String? logo, description;

  const Store({
    required this.id,
    required this.name,
    required this.category,
    required this.subcategory,
    required this.phone,
    required this.email,
    this.logo,
    this.description,
  });

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  Map<String, dynamic> toJson() => _$StoreToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Branch extends Store {
  final String branchId, branchName, hours;
  final String? branchPhone, branchEmail;
  final List<String> floors;

  const Branch({
    required super.id,
    required super.name,
    required super.category,
    required super.subcategory,
    required super.phone,
    required super.email,
    required this.branchId,
    required this.branchName,
    required this.hours,
    required this.floors,
    this.branchPhone,
    this.branchEmail,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);

  Map<String, dynamic> toJson() => _$BranchToJson(this);
}
