import "package:json_annotation/json_annotation.dart";

part "advert.g.dart";

enum AdType {
  @JsonValue("banner")
  banner,
  @JsonValue("interstitial")
  interstitial,
  @JsonValue("square")
  square,
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Advert {
  final int id;
  final String assetUrl, hyperlink;
  final String? altText;
  final AdType type;
  final int? minDurationSeconds;

  const Advert({
    required this.id,
    required this.hyperlink,
    required this.assetUrl,
    required this.type,
    this.minDurationSeconds,
    this.altText,
  });

  factory Advert.fromJson(Map<String, dynamic> json) => _$AdvertFromJson(json);

  Map<String, dynamic> toJson() => _$AdvertToJson(this);
}
