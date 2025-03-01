import '../domain/news_remote_data_source.dart';
import '../domain/news_repository.dart';
import '../domain/paginated_articles.dart';
import 'news_local_data_source.dart';

class NewsRepositoryImpl extends NewsRepository {
  final NewsRemoteDataSource remoteDataSource;
  final NewsLocalDataSource localDataSource;

  NewsRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<PaginatedArticles> getItems({
    String? query,
    int? pageSize,
    int? pageIndex,
  }) async {
    try {
      final items = await remoteDataSource.fetchItems(
        query: query,
        pageIndex: pageIndex,
        pageSize: pageSize,
      );
      await localDataSource.cacheArticles(query, items.articles);
      return items;
    } catch (_) {
      final cachedData = localDataSource.getCachedArticles(query);
      return PaginatedArticles(totalResults: 0, articles: cachedData);
    }
  }
}
