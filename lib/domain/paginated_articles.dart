import 'package:feature_mind_news/domain/domain.dart';

class PaginatedArticles {
  final int totalResults;
  final List<ArticleItem> articles;

  PaginatedArticles({required this.totalResults, required this.articles});
}
