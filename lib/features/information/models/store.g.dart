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
      phone: json['phone'] as String,
      email: json['email'] as String,
      logo: json['logo'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'subcategory': instance.subcategory,
      'phone': instance.phone,
      'email': instance.email,
      'logo': instance.logo,
      'description': instance.description,
    };

Branch _$BranchFromJson(Map<String, dynamic> json) => Branch(
      id: json['id'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      subcategory: json['subcategory'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      branchId: json['branchId'] as String,
      branchName: json['branchName'] as String,
      hours: json['hours'] as String,
      floors:
          (json['floors'] as List<dynamic>).map((e) => e as String).toList(),
      branchPhone: json['branchPhone'] as String?,
      branchEmail: json['branchEmail'] as String?,
    );

Map<String, dynamic> _$BranchToJson(Branch instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'subcategory': instance.subcategory,
      'phone': instance.phone,
      'email': instance.email,
      'branchId': instance.branchId,
      'branchName': instance.branchName,
      'hours': instance.hours,
      'branchPhone': instance.branchPhone,
      'branchEmail': instance.branchEmail,
      'floors': instance.floors,
    };
