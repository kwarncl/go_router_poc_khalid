import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Feature1ListScreen extends StatelessWidget {
  const Feature1ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feature 1 Items'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item ${index + 1}'),
            onTap: () => context.go('/feature1/item/${index + 1}'),
          );
        },
      ),
    );
  }
}
