import 'paginated_articles.dart';

abstract class NewsRemoteDataSource {
  Future<PaginatedArticles> fetchItems({
    String? query,
    int? pageSize,
    int? pageIndex,
  });
}
