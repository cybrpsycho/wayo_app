// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      hit: json['hit'] as String,
      type: $enumDecode(_$ResultTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'type': _$ResultTypeEnumMap[instance.type]!,
      'hit': instance.hit,
    };

const _$ResultTypeEnumMap = {
  ResultType.mall: 'mall',
  ResultType.store: 'store',
};
