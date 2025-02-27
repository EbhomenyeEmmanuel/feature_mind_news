import 'package:feature_mind_news/home/domain/news_repository.dart';

import 'article_item.dart';

class GetArticlesUseCase {
  final NewsRepository repository;

  GetArticlesUseCase(this.repository);

  Future<List<ArticleItem>> get({
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
