import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mall.g.dart';

@JsonSerializable(explicitToJson: true)
class Mall {
  final String id, name, opens, closes, address, location, modelUrl;
  final List<String> images, phoneNumbers;
  final String? email, logoUrl;

  const Mall({
    required this.id,
    required this.name,
    required this.phoneNumbers,
    required this.opens,
    required this.closes,
    required this.address,
    required this.location,
    required this.modelUrl,
    this.images = const [],
    this.email,
    this.logoUrl,
  });

  factory Mall.fromJson(Map<String, dynamic> json) => _$MallFromJson(json);

  Map<String, dynamic> toJson() => _$MallToJson(this);
}

extension ToLatLng on String {
  LatLng toLatLng() {
    final coords = split(',');
    return LatLng(double.parse(coords.first), double.parse(coords.last));
  }
}
