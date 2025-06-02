import 'package:go_router/go_router.dart';

import 'screens/feature2_screen.dart';

/// Feature 2 route configuration
final feature2Routes = [
  GoRoute(
    path: '/feature2',
    builder: (context, state) => const Feature2Screen(),
  ),
];
