// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Store _$StoreFromJson(Map<String, dynamic> json) => Store(
      id: json['id'] as String,
      name: json['name'] as String,
      categoryId: json['categoryId'] as String,
      subcategoryIds: (json['subcategoryIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      phoneNumbers: (json['phoneNumbers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      email: json['email'] as String?,
      logoUrl: json['logoUrl'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'categoryId': instance.categoryId,
      'email': instance.email,
      'logoUrl': instance.logoUrl,
      'description': instance.description,
      'phoneNumbers': instance.phoneNumbers,
      'subcategoryIds': instance.subcategoryIds,
    };
