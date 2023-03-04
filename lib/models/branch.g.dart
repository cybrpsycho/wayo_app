// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Branch _$BranchFromJson(Map<String, dynamic> json) => Branch(
      id: json['id'] as String,
      storeId: json['storeId'] as String,
      mallId: json['mallId'] as String,
      name: json['name'] as String,
      opens: json['opens'] as String,
      closes: json['closes'] as String,
      phoneNumbers: (json['phoneNumbers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      floors: (json['floors'] as List<dynamic>).map((e) => e as int).toList(),
      storeName: json['storeName'] as String?,
      mallName: json['mallName'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$BranchToJson(Branch instance) => <String, dynamic>{
      'id': instance.id,
      'storeId': instance.storeId,
      'mallId': instance.mallId,
      'name': instance.name,
      'opens': instance.opens,
      'closes': instance.closes,
      'storeName': instance.storeName,
      'mallName': instance.mallName,
      'email': instance.email,
      'phoneNumbers': instance.phoneNumbers,
      'floors': instance.floors,
    };
