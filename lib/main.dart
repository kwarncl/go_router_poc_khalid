import 'package:feature1/feature1.dart';
import 'package:feature2/feature2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Go Router Demo',
      routerConfig: router,
    );
  }
}

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        ...feature1Routes,
        ...feature2Routes,
      ],
    ),
  ],
);
