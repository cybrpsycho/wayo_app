import 'package:json_annotation/json_annotation.dart';

part 'branch.g.dart';

@JsonSerializable(explicitToJson: true)
class Branch {
  final String id, storeId, mallId, name, opens, closes;
  final String? storeName, mallName, email;
  final List<String> phoneNumbers;
  final List<int> floors;

  const Branch({
    required this.id,
    required this.storeId,
    required this.mallId,
    required this.name,
    required this.opens,
    required this.closes,
    required this.phoneNumbers,
    required this.floors,
    this.storeName,
    this.mallName,
    this.email,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);

  Map<String, dynamic> toJson() => _$BranchToJson(this);
}
