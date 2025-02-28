import 'package:hive_flutter/hive_flutter.dart';

import '../domain/article_item.dart';

class NewsLocalDataSource {
  final Box<ArticleItem> articleItemBox;

  NewsLocalDataSource(this.articleItemBox);

  List<ArticleItem> getCachedArticles() {
    return articleItemBox.values.toList();
  }

  void cacheArticles(List<ArticleItem> items) {
    articleItemBox.putAll(items.asMap());
  }
}
