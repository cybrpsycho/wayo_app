import "package:json_annotation/json_annotation.dart";

part "hours.g.dart";

@JsonSerializable()
class Hours {
  final String mon, tue, wed, thu, fri, sat, sun;

  const Hours({
    required this.mon,
    required this.tue,
    required this.wed,
    required this.thu,
    required this.fri,
    required this.sat,
    required this.sun,
  });

  factory Hours.fromJson(Map<String, dynamic> json) => _$HoursFromJson(json);

  Map<String, dynamic> toJson() => _$HoursToJson(this);

  List<String> get list => [mon, tue, wed, thu, fri, sat, sun];
}
