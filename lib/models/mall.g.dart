// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mall.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mall _$MallFromJson(Map<String, dynamic> json) => Mall(
      id: json['id'] as String,
      name: json['name'] as String,
      hours: json['hours'] as String,
      address: json['address'] as String,
      location: json['location'] as String,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      stores: (json['stores'] as List<dynamic>?)
              ?.map((e) => Store.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      logo: json['logo'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$MallToJson(Mall instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'hours': instance.hours,
      'address': instance.address,
      'location': instance.location,
      'images': instance.images,
      'stores': instance.stores.map((e) => e.toJson()).toList(),
      'logo': instance.logo,
      'email': instance.email,
    };
