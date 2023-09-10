// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Store _$StoreFromJson(Map<String, dynamic> json) => Store(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      logoUrl: json['logo_url'] as String,
      featureImage: json['feature_image'] as String,
      description: json['description'] as String?,
      phoneNumbers: (json['phone_numbers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'logo_url': instance.logoUrl,
      'feature_image': instance.featureImage,
      'description': instance.description,
      'phone_numbers': instance.phoneNumbers,
    };
