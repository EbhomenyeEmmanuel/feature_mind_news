import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/search_item_data_source.dart';

/// Fetches list of searched queries from the data source
class SearchNotifier extends StateNotifier<List<String>> {
  final SearchItemDataSource _dataSource;
  SearchNotifier(this._dataSource) : super([]) {
    _loadSearchHistory();
  }

  /// Load search history from Hive
  void _loadSearchHistory() {
    state = _dataSource.getSearchItems();
  }

  /// Save search query to data source
  Future<void> saveSearchQuery(String query) async {
    _dataSource.saveSearchItem(query);
    state = _dataSource.getSearchItems();
  }

  /// Remove Search Item from data source
  Future<void> removeSearchItem(String query) async {
    await _dataSource.removeSearchItem(query);
    state = _dataSource.getSearchItems();
  }
}
