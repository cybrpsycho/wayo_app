// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      document: Document.fromJson(json['document'] as Map<String, dynamic>),
      highlights: (json['highlights'] as List<dynamic>)
          .map((e) => Highlights.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'document': instance.document.toJson(),
      'highlights': instance.highlights.map((e) => e.toJson()).toList(),
    };

Document _$DocumentFromJson(Map<String, dynamic> json) => Document(
      id: json['id'] as String,
      name: json['name'] as String,
      mallId: json['mallId'] as String?,
      address: json['address'] as String?,
      storeId: json['storeId'] as String?,
    );

Map<String, dynamic> _$DocumentToJson(Document instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mallId': instance.mallId,
      'storeId': instance.storeId,
      'address': instance.address,
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
