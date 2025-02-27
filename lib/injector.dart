import 'package:feature_mind_news/home/domain/article_item.dart';
import 'package:feature_mind_news/home/domain/news_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'home/data/data.dart';

final getIt = GetIt.I;

Future<void> initApp() async {
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(ArticleItemAdapter());
  }
  final Box<ArticleItem> articleItemBox = await Hive.openBox("articleItemBox");

  /// datasources
  getIt.registerSingleton<NewsRemoteDataSource>(NewsRemoteDataSource());

  getIt.registerSingleton<NewsLocalDataSource>(
      NewsLocalDataSource(articleItemBox));

  /// repositories
  getIt.registerSingleton<NewsRepository>(NewsRepositoryImpl(
    remoteDataSource: getIt(),
    localDataSource: getIt(),
  ));
}
