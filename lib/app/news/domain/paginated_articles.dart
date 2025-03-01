import 'article_item.dart';

class PaginatedArticles {
  final int totalResults;
  final List<ArticleItem> articles;

  PaginatedArticles({required this.totalResults, required this.articles});
}
