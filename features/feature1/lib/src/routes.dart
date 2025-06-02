import 'package:go_router/go_router.dart';

import 'screens/feature1_screen.dart';

/// Feature 1 route configuration
final feature1Routes = [
  GoRoute(
    path: '/feature1',
    builder: (context, state) => const Feature1Screen(),
  ),
];
