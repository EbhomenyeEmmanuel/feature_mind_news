import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:feature_mind_news/injector.dart';
import 'domain/news_state.dart';
import 'init.dart';
import 'presentation/input_screen.dart';
import 'presentation/news_provider.dart';
import 'presentation/search_notifier.dart';

final newsNotifierProvider =
    StateNotifierProvider<NewsNotifier, NewsState>((ref) {
  return NewsNotifier(getIt());
});

final searchNotifierProvider =
    StateNotifierProvider<SearchNotifier, List<String>>((ref) {
  return SearchNotifier(getIt());
});

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Material(
      child: Container(
        color: AppColors.primary,
        alignment: Alignment.center,
        child: const Text(
          'An error has occurred!',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  };

  await initApp();
  await dotenv.load(fileName: "keys.env");
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feature Mind News',
      theme: NewsAppTheme.light(),
      home: const InputScreen(),
    );
  }
}
