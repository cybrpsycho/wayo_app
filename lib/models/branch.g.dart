// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Branch _$BranchFromJson(Map<String, dynamic> json) => Branch(
      id: json['id'] as int,
      name: json['name'] as String,
      phoneNumbers: (json['phone_numbers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      categoryId: json['category_id'] as int,
      hours: Hours.fromJson(json['hours'] as Map<String, dynamic>),
      floor: json['floor'] as String,
      storeModelName: json['store_model_name'] as String?,
      description: json['description'] as String?,
      email: json['email'] as String?,
      logoUrl: json['logo_url'] as String?,
      assetUrls: (json['asset_urls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$BranchToJson(Branch instance) => <String, dynamic>{
      'id': instance.id,
      'category_id': instance.categoryId,
      'name': instance.name,
      'floor': instance.floor,
      'description': instance.description,
      'email': instance.email,
      'logo_url': instance.logoUrl,
      'store_model_name': instance.storeModelName,
      'hours': instance.hours,
      'phone_numbers': instance.phoneNumbers,
      'asset_urls': instance.assetUrls,
    };
