// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mall.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mall _$MallFromJson(Map<String, dynamic> json) => Mall(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      hours: json['hours'] as String,
      address: json['address'] as String,
      location: json['location'] as String,
      model: json['model'] as String,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$MallToJson(Mall instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'hours': instance.hours,
      'address': instance.address,
      'location': instance.location,
      'model': instance.model,
      'images': instance.images,
      'logo': instance.logo,
    };
