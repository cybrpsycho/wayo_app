// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mall.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mall _$MallFromJson(Map<String, dynamic> json) => Mall(
      id: json['id'] as String,
      name: json['name'] as String,
      phoneNumbers: (json['phoneNumbers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      opens: json['opens'] as String,
      closes: json['closes'] as String,
      address: json['address'] as String,
      location: json['location'] as String,
      modelUrl: json['modelUrl'] as String,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      email: json['email'] as String?,
      logoUrl: json['logoUrl'] as String?,
    );

Map<String, dynamic> _$MallToJson(Mall instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'opens': instance.opens,
      'closes': instance.closes,
      'address': instance.address,
      'location': instance.location,
      'modelUrl': instance.modelUrl,
      'images': instance.images,
      'phoneNumbers': instance.phoneNumbers,
      'email': instance.email,
      'logoUrl': instance.logoUrl,
    };
