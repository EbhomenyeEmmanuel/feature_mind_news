import '../../../main.dart';
import 'news_list_screen.dart';

import '../../../init.dart';

class InputScreen extends ConsumerStatefulWidget {
  const InputScreen({super.key});

  @override
  ConsumerState<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends ConsumerState<InputScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController inputCtrl;
  @override
  void initState() {
    super.initState();
    inputCtrl = TextEditingController(); //instantiate the controller
    bool hasNavigated = false;
    ref.listenManual(newsNotifierProvider, (previous, next) {
      if (!mounted) return; // Prevent execution if the widget is disposed
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        //Listen for state changes
        if (next.articles.isNotEmpty && !hasNavigated) {
          hasNavigated = true;
          debugPrint('Navigating to screen 2');
          ref
              .read(searchNotifierProvider.notifier)
              .saveSearchQuery(inputCtrl.text);
          await Navigator.of(context)
              .push(FadePageRoute(
                  page: NewsListScreen(query: next.query ?? inputCtrl.text)))
              .then((_) => hasNavigated = false);
        }
        if (next.error != null) {
          if (!mounted) return;
          Utils.showSnackBar(title: 'Error', context, message: next.error!);
          ref.read(newsNotifierProvider.notifier).resetError();
        }
      });
    });
  }

  @override
  void dispose() {
    inputCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(newsNotifierProvider).isLoading;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Input your query',
                  textAlign: TextAlign.center,
                  style: context.textTheme.displayMedium),
              const SizedBox(
                height: 32,
              ),
              TextFormField(
                readOnly: isLoading,
                decoration: const InputDecoration(
                  hintText: "Enter a keyword",
                ),
                controller: inputCtrl,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "Input cannot be empty";
                  } else if (value!.length < 3) {
                    return "Enter at least 3 characters";
                  }
                  return null;
                },
                onEditingComplete: () {
                  if (_formKey.currentState!.validate()) {
                    ref
                        .read(newsNotifierProvider.notifier)
                        .fetchNews(inputCtrl.text);
                  }
                },
              ),
              const SizedBox(
                height: 32,
              ),
              CustomButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ref
                        .read(newsNotifierProvider.notifier)
                        .fetchNews(inputCtrl.text);
                  }
                },
                text: 'Search',
                isLoading: isLoading,
              )
            ],
          ),
        ),
      ),
    );
  }
}
