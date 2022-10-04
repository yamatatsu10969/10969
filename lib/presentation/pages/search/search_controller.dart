import 'package:app10969/data/repositories/search_history/search_history_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/entities/search_history.dart';

class SearchController extends StateNotifier<AsyncValue<void>> {
  SearchController(this.searchHistoryRepository)
      : super(const AsyncValue.data(null));

  final SearchHistoryRepository searchHistoryRepository;

  Future<void> addSearchHistory(String query) async {
    state = const AsyncValue.loading();
    // final searchHistories = await searchHistoryRepository.fetchSearchHistory();
    // final newSearchHistories = [
    //   ...searchHistories,
    //   SearchHistory(query: query, createdAt: DateTime.now()),
    // ];
    state = await AsyncValue.guard(
      () => searchHistoryRepository.setSearchHistory(
        SearchHistory(query: query, createdAt: DateTime.now()),
      ),
    );
  }
}

final searchControllerProvider =
    StateNotifierProvider<SearchController, AsyncValue<void>>((ref) {
  return SearchController(ref.read(searchHistoryRepositoryProvider));
});

final searchHistoriesProvider = StreamProvider<List<SearchHistory>>((ref) {
  return ref.watch(searchHistoryRepositoryProvider).watchSearchHistory();
});
