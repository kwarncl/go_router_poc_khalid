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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.push('/feature1'),
              child: const Text('Go to Feature 1'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.push('/feature2'),
              child: const Text('Go to Feature 2'),
            ),
          ],
        ),
      ),
    );
  }
}
