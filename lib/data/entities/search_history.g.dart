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
          keyword: $checkedConvert('keyword', (v) => v as String),
          createdAt:
              $checkedConvert('created_at', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
      fieldKeyMap: const {'createdAt': 'created_at'},
    );

Map<String, dynamic> _$$_SearchHistoryToJson(_$_SearchHistory instance) =>
    <String, dynamic>{
      'keyword': instance.keyword,
      'created_at': instance.createdAt.toIso8601String(),
    };
