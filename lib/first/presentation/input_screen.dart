import 'package:feature_mind_news/common/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:feature_mind_news/common/presentation/components/components.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Input your query',
                textAlign: TextAlign.center,
                style: context.textTheme.displayMedium),
            const SizedBox(
              height: 32,
            ),
            TextField(
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 32,
            ),
            CustomButton(
              onPressed: () {},
              text: 'Search',
              isLoading: true,
            )
          ],
        ),
      ),
    );
  }
}
