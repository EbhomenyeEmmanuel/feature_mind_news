import 'package:freezed_annotation/freezed_annotation.dart';

import 'article_item.dart';
part 'news_state.freezed.dart';

@freezed
class NewsState with _$NewsState {
  const NewsState._();

  const factory NewsState(
      {@Default(false) bool isLoading,
      @Default(false) bool isLoadingMore,
      @Default([]) List<ArticleItem> articles,
      @Default(null) String? query,
      @Default(null) String? error,
      @Default(false) bool isEveryArticleLoaded}) = _NewsState;
}
