import 'package:hive_flutter/hive_flutter.dart';

class SearchItemDataSource {
  late Box<String> _box;

  SearchItemDataSource(Box<String> box) {
    _box = box;
  }

  String? getSearchItem(int id) {
    return _box.get(id);
  }

  List<String> getSearchItems() {
    return _box.keys.cast<String>().toList();
  }

  int getItemsSize() {
    return _box.values.toList().length;
  }

  Future<void> saveSearchItem(String query) async {
    if (!_box.containsKey(query)) {
      await _box.put(query, DateTime.now().millisecondsSinceEpoch.toString());
    }
  }

  Future<void> removeSearchItem(String query) async {
    await _box.delete(query);
  }
}
