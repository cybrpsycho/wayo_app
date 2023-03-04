// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      highlights: (json['highlights'] as List<dynamic>)
          .map((e) => Highlights.fromJson(e as Map<String, dynamic>))
          .toList(),
      document: json['document'],
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'document': instance.document,
      'highlights': instance.highlights.map((e) => e.toJson()).toList(),
    };

Highlights _$HighlightsFromJson(Map<String, dynamic> json) => Highlights(
      field: json['field'] as String,
      snippet: json['snippet'] as String,
    );

Map<String, dynamic> _$HighlightsToJson(Highlights instance) =>
    <String, dynamic>{
      'field': instance.field,
      'snippet': instance.snippet,
    };
