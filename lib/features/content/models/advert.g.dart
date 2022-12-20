// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Advert _$AdvertFromJson(Map<String, dynamic> json) => Advert(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      hyperlink: json['hyperlink'] as String,
      media: json['media'] as String,
    );

Map<String, dynamic> _$AdvertToJson(Advert instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'hyperlink': instance.hyperlink,
      'media': instance.media,
    };
