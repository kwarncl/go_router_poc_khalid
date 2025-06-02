import 'package:go_router/go_router.dart';

import 'screens/feature1_detail_screen.dart';
import 'screens/feature1_list_screen.dart';

/// Feature 1 route configuration
final feature1Routes = [
  GoRoute(
    path: '/feature1',
    builder: (context, state) => const Feature1ListScreen(),
    routes: [
      GoRoute(
        path: 'item/:id',
        builder: (context, state) =>
            Feature1DetailScreen(itemId: state.pathParameters['id']!),
      ),
    ],
  ),
];
