import 'article_item.dart';

class PaginatedArticles {
  final int totalResults;
  final List<ArticleItem> articles;
  final String? error;

  PaginatedArticles(
      {required this.totalResults, required this.articles, this.error});
}
