// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Store _$StoreFromJson(Map<String, dynamic> json) => Store(
      id: json['id'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      subcategory: json['subcategory'] as String,
      hours: json['hours'] as String,
      phone: json['phone'] as String,
      floors:
          (json['floors'] as List<dynamic>).map((e) => e as String).toList(),
      logo: json['logo'] as String?,
      description: json['description'] as String?,
      email: json['email'] as String?,
      objectName: json['objectName'] as String?,
      objectImage: json['objectImage'] as String?,
    );

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'subcategory': instance.subcategory,
      'hours': instance.hours,
      'phone': instance.phone,
      'logo': instance.logo,
      'description': instance.description,
      'email': instance.email,
      'objectName': instance.objectName,
      'objectImage': instance.objectImage,
      'floors': instance.floors,
    };
