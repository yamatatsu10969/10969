// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchHistory _$$_SearchHistoryFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_SearchHistory',
      json,
      ($checkedConvert) {
        final val = _$_SearchHistory(
          query: $checkedConvert('query', (v) => v as String),
          createdAt:
              $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_SearchHistoryToJson(_$_SearchHistory instance) =>
    <String, dynamic>{
      'query': instance.query,
      'createdAt': instance.createdAt.toIso8601String(),
    };
