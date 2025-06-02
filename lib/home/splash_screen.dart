import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to home screen after delay
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        context.go(AppRoute.home.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 20),
            Text('Loading app...'),
          ],
        ),
      ),
    );
  }
}
