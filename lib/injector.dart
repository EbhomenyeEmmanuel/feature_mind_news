import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'data/data.dart';
import 'domain/domain.dart';

final getIt = GetIt.I;

Future<void> initApp() async {
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(ArticleItemAdapter());
  }
  final Box<List<ArticleItem>> articleItemBox =
      await Hive.openBox("articleItemBox");
  final Box<String> searchBox = await Hive.openBox("searchBox");

  /// datasources
  getIt.registerSingleton<NewsRemoteDataSource>(NewsRemoteDataSource());

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
