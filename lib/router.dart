import 'package:feature1/feature1.dart';
import 'package:feature2/feature2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    ...feature1Routes,
    ...feature2Routes,
  ],
);

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
              onPressed: () => context.go('/feature1'),
              child: const Text('Go to Feature 1'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go('/feature2'),
              child: const Text('Go to Feature 2'),
            ),
          ],
        ),
      ),
    );
  }
}
