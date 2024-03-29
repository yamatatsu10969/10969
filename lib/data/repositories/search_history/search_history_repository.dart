import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../entities/search_history.dart';

abstract class SearchHistoryRepository {
  Future<List<SearchHistory>> fetchSearchHistory();
  Stream<List<SearchHistory>> watchSearchHistory();
  Future<void> deleteSearchHistory(SearchHistory searchHistory);
  Future<void> setSearchHistory(SearchHistory searchHistory);
}

final searchHistoryRepositoryProvider =
    Provider<SearchHistoryRepository>((ref) {
  // * Override this in the main method
  throw UnimplementedError();
});
