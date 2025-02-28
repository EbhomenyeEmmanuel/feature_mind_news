import 'package:hive_flutter/hive_flutter.dart';

import '../domain/article_item.dart';

class NewsLocalDataSource {
  final Box<List<ArticleItem>> articleItemBox;

  NewsLocalDataSource(this.articleItemBox);

  List<ArticleItem> getCachedArticles(String? query) =>
      articleItemBox.get(query) ?? [];

  Future<void> cacheArticles(String? query, List<ArticleItem> items) async {
    final totalCachedItems = (getCachedArticles(query) + items).toList();
    await articleItemBox.put(query, totalCachedItems);
  }
}
