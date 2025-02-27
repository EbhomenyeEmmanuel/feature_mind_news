import 'package:feature_mind_news/home/domain/article_item.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
