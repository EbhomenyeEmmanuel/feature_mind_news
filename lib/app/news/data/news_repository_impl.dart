import 'dart:io';

import 'package:feature_mind_news/common/utils/utils.dart';

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
    } on SocketException catch (_) {
      // Handle no internet connection
      Utils.log(message: "Catch error: No Internet Connection!");
      return _getCachedArticlesWithError(query, 'No Internet Connection!');
    } catch (error, stacktrace) {
      Utils.log(message: "Catch error: $error");
      Utils.log(message: "$stacktrace");
      // Handle other exceptions
      final errorMessage = error is Exception
          ? error.toString().replaceAll('Exception: ', '')
          : 'An error occurred.';
      return _getCachedArticlesWithError(query, errorMessage);
    }
  }

  //returns cached articles with an error message
  PaginatedArticles _getCachedArticlesWithError(
      String? query, String errorMessage) {
    final cachedData = localDataSource.getCachedArticles(query);
    return PaginatedArticles(
      totalResults: 0,
      articles: cachedData,
      error: errorMessage,
    );
  }
}
