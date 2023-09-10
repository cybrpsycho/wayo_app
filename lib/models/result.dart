import "package:json_annotation/json_annotation.dart";

part "result.g.dart";

enum ResultType { mall, store }

@JsonSerializable(fieldRename: FieldRename.snake)
class Result {
  final ResultType type;
  final String hit;

  const Result({required this.hit, required this.type});

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
