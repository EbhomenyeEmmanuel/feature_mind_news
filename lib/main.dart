import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:feature_mind_news/injector.dart';

import 'app_theme.dart';
import 'common/utils/colors.dart';
import 'domain/get_articles_usecase.dart';
import 'domain/news_state.dart';
import 'presentation/input_screen.dart';
import 'presentation/news_provider.dart';

final newsNotifierProvider =
    StateNotifierProvider<NewsNotifier, NewsState>((ref) {
  final useCaseProvider = Provider<GetArticlesUseCase>((ref) {
    return getIt();
  });
  return NewsNotifier(ref.read(useCaseProvider));
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

//Used page route builder to create a transition animation
class FadePageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;
  FadePageRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
}
