import 'dart:async';

import 'package:app10969/data/entities/search_history.dart';
import 'package:app10969/data/repositories/search_history/search_history_repository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class SembastSearchHistoryRepository implements SearchHistoryRepository {
  SembastSearchHistoryRepository(this.db);
  final Database db;
  final store = intMapStoreFactory.store(searchHistoriesKey);

  static const searchHistoriesKey = 'searchHistories';
  static Future<Database> createDatabase(String filename) async {
    final appDocDir = await getApplicationDocumentsDirectory();
    return databaseFactoryIo.openDatabase('${appDocDir.path}/$filename');
  }

  static Future<SembastSearchHistoryRepository> makeDefault() async {
    return SembastSearchHistoryRepository(await createDatabase('default.db'));
  }

  static StreamTransformer<List<RecordSnapshot<int, Map<String, Object?>>>,
          List<SearchHistory>> searchHistoriesTransformer =
      StreamTransformer<List<RecordSnapshot<int, Map<String, Object?>>>,
          List<SearchHistory>>.fromHandlers(
    handleData: (snapshotList, sink) {
      sink.add(
        snapshotList.map((e) => SearchHistory.fromJson(e.value)).toList(),
      );
    },
  );

  @override
  Future<List<SearchHistory>> fetchSearchHistory() async {
    final snapshots = await store.find(db);
    return snapshots
        .map((snapshot) => SearchHistory.fromJson(snapshot.value))
        .toList(growable: false);
  }

  @override
  Future<void> setSearchHistory(SearchHistory searchHistory) {
    return store.add(
      db,
      searchHistory.toJson(),
    );
  }

  @override
  Stream<List<SearchHistory>> watchSearchHistory() {
    return store
        .query(
          finder: Finder(
            sortOrders: [
              SortOrder('createdAt', false),
            ],
          ),
        )
        .onSnapshots(db)
        .transform(searchHistoriesTransformer);
  }
}
