import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable(explicitToJson: true)
class Result {
  final dynamic document;
  final List<Highlights> highlights;

  Result({required this.highlights, this.document});

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class Highlights {
  final String field, snippet;

  const Highlights({required this.field, required this.snippet});

  factory Highlights.fromJson(Map<String, dynamic> json) =>
      _$HighlightsFromJson(json);

  Map<String, dynamic> toJson() => _$HighlightsToJson(this);
}
