import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Feature2TabsScreen extends StatelessWidget {
  const Feature2TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feature 2 Tabs'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () => context.push('/feature2/tab1'),
              child: const Text('Go to Tab 1'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.push('/feature2/tab2'),
              child: const Text('Go to Tab 2'),
            ),
          ],
        ),
      ),
    );
  }
}
