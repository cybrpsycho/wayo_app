import "package:json_annotation/json_annotation.dart";
import "package:latlong2/latlong.dart";
import "package:wayo/models/hours.dart";

part "mall.g.dart";

@JsonSerializable(fieldRename: FieldRename.snake)
class Mall {
  final int id;
  final String name, physicalAddress;
  final String? email, logoUrl, modelUrl;
  @JsonKey(fromJson: latLngFromJson)
  final LatLng coordinates;
  final Hours hours;
  final List<String> phoneNumbers, assetUrls;

  const Mall({
    required this.id,
    required this.name,
    required this.coordinates,
    required this.physicalAddress,
    required this.phoneNumbers,
    this.email,
    required this.hours,
    this.logoUrl,
    this.modelUrl,
    this.assetUrls = const [],
  });

  factory Mall.fromJson(Map<String, dynamic> json) => _$MallFromJson(json);

  Map<String, dynamic> toJson() => _$MallToJson(this);

  static LatLng latLngFromJson(Map<String, dynamic> json) {
    return LatLng(json["lat"], json["long"]);
  }
}
