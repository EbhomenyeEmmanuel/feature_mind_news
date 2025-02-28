import 'news_repository.dart';
import 'paginated_articles.dart';

class GetArticlesUseCase {
  final NewsRepository repository;

  GetArticlesUseCase(this.repository);

  Future<PaginatedArticles> get({
    String? query,
    int? pageSize,
    int? pageIndex,
  }) async {
    return await repository.getItems(
      query: query,
      pageIndex: pageIndex,
      pageSize: pageSize,
    );
  }
}
