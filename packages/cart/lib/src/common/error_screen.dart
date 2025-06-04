import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Not Found')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('The requested page was not found'),
            const SizedBox(height: 16),
            ElevatedButton(
              /// Navigate to root route for error recovery
              ///
              /// Using absolute path '/' ensures we navigate to the app's
              /// root route regardless of the current navigation context.
              /// This provides a reliable escape route from any error state.
              onPressed: () => context.go('/'),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}
