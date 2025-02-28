import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../common/utils/utils.dart';
import '../domain/get_articles_usecase.dart';
import '../domain/news_state.dart';

class NewsNotifier extends StateNotifier<NewsState> {
  final GetArticlesUseCase useCase;
  int _page = 1;
  int resultPerPage = 20;
  NewsNotifier(this.useCase) : super(const NewsState());

  Future<void> fetchNews(String query, {bool isLoadMore = false}) async {
    if (state.isLoading || (isLoadMore && state.isEveryArticleLoaded)) {
      return;
    }
    state = state.copyWith(
        isLoading: !isLoadMore, query: query, isLoadingMore: isLoadMore);
    if (isLoadMore) {
      _page++;
    } else {
      state = state.copyWith(
          articles: [],
          isEveryArticleLoaded: false); // Clear previous state for new searches
      _page = 1;
    }

    try {
      Utils.log(message: "Page $_page");
      final res = await useCase.get(
          query: query, pageIndex: _page, pageSize: resultPerPage);

      // Calculate total pages left in the api using resultPerPage query
      final totalPages = (res.totalResults / resultPerPage).ceil();

      final articles = state.articles.followedBy(res.articles).toList();
      state = state.copyWith(
          articles: articles, isEveryArticleLoaded: _page >= totalPages);
    } on SocketException catch (_) {
      state = state.copyWith(error: 'No Internet Connection!');
    } catch (error, stacktrace) {
      Utils.log(message: "Catch error: $error");
      Utils.log(message: "$stacktrace");
      debugPrint("Error fetching news: $error");
      state = state.copyWith(
        error: error.toString().replaceAll('Exception: ', ''),
      );
      _page = 1;
    } finally {
      state = state.copyWith(isLoading: false, isLoadingMore: false);
    }
  }

  /// Reset the error after error is displayed
  void resetError() {
    state = state.copyWith(error: null);
  }

  // /// Reset the error after error is displayed
  // void resetNavigation() {
  //   state = state.copyWith(hasNavigated: false);
  // }
}
