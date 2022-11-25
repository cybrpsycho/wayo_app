import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wayo/models/store.dart';

part 'mall.g.dart';

@JsonSerializable(explicitToJson: true)
class Mall {
  final String id, name, hours, address, location, model;
  final List<String> images;
  final String? logo, email;

  const Mall({
    required this.id,
    required this.name,
    required this.hours,
    required this.address,
    required this.location,
    required this.model,
    this.images = const [],
    this.logo,
    this.email,
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
