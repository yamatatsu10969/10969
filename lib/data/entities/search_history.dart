import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_history.freezed.dart';
part 'search_history.g.dart';

@freezed
class SearchHistory with _$SearchHistory {
  const factory SearchHistory({
    required String keyword,
    required DateTime createdAt,
  }) = _SearchHistory;

  factory SearchHistory.fromJson(Map<String, dynamic> json) =>
      _$SearchHistoryFromJson(json);
}
