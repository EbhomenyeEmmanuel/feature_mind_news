import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/news/data/data.dart';
import 'app/news/domain/domain.dart';
import 'app/search/data/data.dart';

final getIt = GetIt.I;

/// Service locator container class that does the registration of singleton components.
Future<void> initApp() async {
  //Initialized Hive in the project
  await Hive.initFlutter();

  //Registered adapter for custom hive adapter class
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(ArticleItemAdapter());
  }
  final Box<List<ArticleItem>> articleItemBox =
      await Hive.openBox("articleItemBox");
  final Box<String> searchBox = await Hive.openBox("searchBox");

  /// datasources
  getIt.registerSingleton<NewsRemoteDataSource>(NewsRemoteDataSourceImpl());

  getIt.registerSingleton<NewsLocalDataSource>(
      NewsLocalDataSource(articleItemBox));

  getIt
      .registerSingleton<SearchItemDataSource>(SearchItemDataSource(searchBox));

  /// repositories
  getIt.registerSingleton<NewsRepository>(NewsRepositoryImpl(
    remoteDataSource: getIt(),
    localDataSource: getIt(),
  ));

  getIt.registerSingleton<GetArticlesUseCase>(GetArticlesUseCase(getIt()));
}
