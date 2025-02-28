import 'package:feature_mind_news/domain/article_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_state.freezed.dart';

@freezed
class NewsState with _$NewsState {
  const NewsState._();

  const factory NewsState({
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    @Default([]) List<ArticleItem> articles,
    @Default(null) String? query,
    @Default(null) String? error,
    @Default(false) bool isEveryArticleLoaded,
  }) = _NewsState;
}
