import 'paginated_articles.dart';

abstract class NewsRepository {
  Future<PaginatedArticles> getItems(
      {String? query, int? pageSize, int? pageIndex});
}
