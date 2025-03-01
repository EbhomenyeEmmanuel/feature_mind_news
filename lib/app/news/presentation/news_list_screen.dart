import 'package:feature_mind_news/app/search/presentation/search_screen.dart';
import '../../../init.dart';
import '../../../main.dart';

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
    ref.listenManual(newsNotifierProvider, (previous, next) async {
      if (!mounted) return; // Prevent execution if the widget is disposed
      //Listen for state changes
      if (next.error != null) {
        Utils.showSnackBar(title: 'Error', context, message: next.error!);
        ref.read(newsNotifierProvider.notifier).resetError();
      }
    });
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
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SvgIconButton('search', onTap: () async {
              await Navigator.of(context)
                  .push(LeftToRightPageRoute(page: const SearchScreen()));
            }),
          ),
        ],
        title:
            Align(child: Text('News', style: context.textTheme.displayMedium)),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
              color: AppColors.primary,
              strokeWidth: 2,
            ))
          : RefreshIndicator(
              onRefresh: () async {
                // Refresh the provider
                final notifier = ref.refresh(newsNotifierProvider.notifier);
                notifier.fetchNews(widget.query);
              },
              child: ListView(
                controller: _scrollController,
                children: [
                  ...newsList.map((article) => ListTile(
                        leading: FeatureMindNetworkImage(
                          url: article.urlToImage,
                          errorPlaceholder: article.title,
                          width: 50,
                          height: 50,
                          isCircular: true,
                        ),
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
            ),
    );
  }
}
