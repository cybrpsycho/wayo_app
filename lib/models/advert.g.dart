// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Advert _$AdvertFromJson(Map<String, dynamic> json) => Advert(
      id: json['id'] as int,
      hyperlink: json['hyperlink'] as String,
      assetUrl: json['asset_url'] as String,
      type: $enumDecode(_$AdTypeEnumMap, json['type']),
      minDurationSeconds: json['min_duration_seconds'] as int?,
      altText: json['alt_text'] as String?,
    );

Map<String, dynamic> _$AdvertToJson(Advert instance) => <String, dynamic>{
      'id': instance.id,
      'asset_url': instance.assetUrl,
      'hyperlink': instance.hyperlink,
      'alt_text': instance.altText,
      'type': _$AdTypeEnumMap[instance.type]!,
      'min_duration_seconds': instance.minDurationSeconds,
    };

const _$AdTypeEnumMap = {
  AdType.banner: 'banner',
  AdType.interstitial: 'interstitial',
  AdType.square: 'square',
};
