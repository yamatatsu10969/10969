// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchHistoryImpl _$$SearchHistoryImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$SearchHistoryImpl',
      json,
      ($checkedConvert) {
        final val = _$SearchHistoryImpl(
          query: $checkedConvert('query', (v) => v as String),
          createdAt:
              $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$SearchHistoryImplToJson(_$SearchHistoryImpl instance) =>
    <String, dynamic>{
      'query': instance.query,
      'createdAt': instance.createdAt.toIso8601String(),
    };
