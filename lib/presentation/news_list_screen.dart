import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/utils/colors.dart';
import '../main.dart';

class NewsListScreen extends ConsumerStatefulWidget {
  final String query;
  const NewsListScreen({super.key, required this.query});

  @override
  ConsumerState<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends ConsumerState<NewsListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.atEdge && _scrollController.offset > 0) {
      ref
          .read(newsNotifierProvider.notifier)
          .fetchNews(widget.query, isLoadMore: true);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(newsNotifierProvider);
    final newsList = state.articles;
    final isLoading = state.isLoading;

    return Scaffold(
      appBar: AppBar(title: const Text('News')),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
              color: AppColors.primary,
              strokeWidth: 2,
            ))
          : ListView(
              controller: _scrollController,
              children: [
                ...newsList.map((article) => ListTile(
                      title: Text(article.title),
                      subtitle: Text(article.description),
                    )),
                if (state.isLoadingMore) ...{
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      height: 30,
                      width: 30,
                      child: const CircularProgressIndicator(
                        color: AppColors.primary,
                        strokeWidth: 2,
                      ),
                    ),
                  )
                }
              ],
            ),
    );
  }
}
