import 'package:json_annotation/json_annotation.dart';

part 'advert.g.dart';

enum AdType { banner, interstitial, leaderboard, square, video }

@JsonSerializable(explicitToJson: true)
class Advert {
  final String id, title, description, hyperlink, media;

  const Advert({
    required this.id,
    required this.title,
    required this.description,
    required this.hyperlink,
    required this.media,
  });

  factory Advert.fromJson(Map<String, dynamic> json) => _$AdvertFromJson(json);

  Map<String, dynamic> toJson() => _$AdvertToJson(this);
}
