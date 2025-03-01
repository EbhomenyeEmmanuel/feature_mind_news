import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:feature_mind_news/injector.dart';
import 'app/news/news.dart';
import 'init.dart';
import 'app/search/presentation/search_notifier.dart';

//Declare the newsNotifierProvider
final newsNotifierProvider =
    StateNotifierProvider<NewsNotifier, NewsState>((ref) {
  return NewsNotifier(getIt()); //Injected components via contructor injection
});

//Declare the newsNotifierProvider
final searchNotifierProvider =
    StateNotifierProvider<SearchNotifier, List<String>>((ref) {
  return SearchNotifier(getIt()); //Injected components via contructor injection
});

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ErrorWidget.builder = (FlutterErrorDetails details) {
    //Displayed a custom widget if the framework encounters an error instead of the default grey content
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
