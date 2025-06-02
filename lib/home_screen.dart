import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Go Router Demo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Feature 1',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          ListTile(
            title: const Text('Feature 1 package'),
            subtitle: const Text('Navigate to Feature 1'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => context.go('/feature1'),
          ),
          ListTile(
            title: const Text('Feature 1, item 7'),
            subtitle: const Text(
              'Navigate to item 7 in Feature 1 and preserve route',
            ),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => context.go('/feature1/item/7'),
          ),
          const SizedBox(height: 50),
          TextButton(
            onPressed: () => context.go('/feature2'),
            child: const Text('Go to Feature 2'),
          ),
        ],
      ),
    );
  }
}
