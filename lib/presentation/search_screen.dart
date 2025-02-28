import 'package:feature_mind_news/main.dart';
import 'package:collection/collection.dart';

import '../init.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchItems = ref.watch(searchNotifierProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text('Recent searches',
              textAlign: TextAlign.center,
              style: context.textTheme.displayMedium),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: (searchItems.isEmpty)
                ? const SizedBox.shrink()
                : ListView(
                    children: [
                      ...searchItems
                          .mapIndexed((index, e) => _SearchContentItem(
                                e,
                                onSearch: () async {
                                  Navigator.pop(context);
                                  ref
                                      .read(newsNotifierProvider.notifier)
                                      .fetchNews(e);
                                },
                                onDelete: () async {
                                  ref
                                      .read(searchNotifierProvider.notifier)
                                      .removeSearchItem(e);
                                },
                              )),
                      const SizedBox.shrink(),
                    ],
                  )));
  }
}

class _SearchContentItem extends StatelessWidget {
  const _SearchContentItem(this.text, {this.onSearch, this.onDelete});
  final String text;
  final VoidCallback? onSearch;
  final VoidCallback? onDelete;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SvgIcon('search'),
        const SizedBox(width: 22),
        Flexible(
          child: Column(
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                const SvgIcon('outlet'),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: onSearch,
                    child: Text(
                      text,
                      style: context.textTheme.displaySmall,
                      maxLines: 3,
                    ),
                  ),
                ),
                SvgIconButton('close',
                    onTap: (onDelete == null) ? () {} : onDelete!)
              ]),
              const SizedBox(height: 5),
              const Divider(color: Color(0xFFF2F2F2)),
            ],
          ),
        ),
      ],
    );
  }
}
