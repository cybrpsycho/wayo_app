import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable(explicitToJson: true)
class Result {
  final Document document;
  final List<Highlights> highlights;

  const Result({required this.document, required this.highlights});

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class Document {
  final String id, name;
  final String? mallId, storeId, address;

  const Document({
    required this.id,
    required this.name,
    this.mallId,
    this.address,
    this.storeId,
  });

  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentToJson(this);
}

@JsonSerializable()
class Highlights {
  final String field, snippet;

  const Highlights({required this.field, required this.snippet});

  factory Highlights.fromJson(Map<String, dynamic> json) =>
      _$HighlightsFromJson(json);

  Map<String, dynamic> toJson() => _$HighlightsToJson(this);
}
