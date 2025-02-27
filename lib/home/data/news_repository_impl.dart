import '../domain/article_item.dart';
import '../domain/news_repository.dart';
import 'news_local_data_source.dart';
import 'news_remote_data_source.dart';

class NewsRepositoryImpl extends NewsRepository {
  final NewsRemoteDataSource remoteDataSource;
  final NewsLocalDataSource localDataSource;

  NewsRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<List<ArticleItem>> getItems({
    String? query,
    int? pageSize,
    int? pageIndex,
  }) async {
    // final cachedData = localDataSource.getCachedArticles();
    // if (cachedData.isNotEmpty) {
    //   return cachedData;
    // }
    final items = await remoteDataSource.fetchItems(
      query: query,
      pageIndex: pageIndex,
      pageSize: pageSize,
    );
    // localDataSource.cacheArticles(items);
    return items;
  }
}
