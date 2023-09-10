// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mall.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mall _$MallFromJson(Map<String, dynamic> json) => Mall(
      id: json['id'] as int,
      name: json['name'] as String,
      coordinates:
          Mall.latLngFromJson(json['coordinates'] as Map<String, dynamic>),
      physicalAddress: json['physical_address'] as String,
      phoneNumbers: (json['phone_numbers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      email: json['email'] as String?,
      hours: Hours.fromJson(json['hours'] as Map<String, dynamic>),
      logoUrl: json['logo_url'] as String?,
      modelUrl: json['model_url'] as String?,
      assetUrls: (json['asset_urls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$MallToJson(Mall instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'physical_address': instance.physicalAddress,
      'email': instance.email,
      'logo_url': instance.logoUrl,
      'model_url': instance.modelUrl,
      'coordinates': instance.coordinates,
      'hours': instance.hours,
      'phone_numbers': instance.phoneNumbers,
      'asset_urls': instance.assetUrls,
    };
