import 'article_item.dart';

abstract class NewsRepository {
  Future<List<ArticleItem>> getItems({
    String? query,
    int? pageSize,
    int? pageIndex
  });
}
