import 'package:go_router/go_router.dart';

import 'screens/feature2_tab1_screen.dart';
import 'screens/feature2_tab2_screen.dart';
import 'screens/feature2_tabs_screen.dart';

/// Feature 2 route configuration
final feature2Routes = [
  GoRoute(
    path: '/feature2',
    builder: (context, state) => const Feature2TabsScreen(),
    routes: [
      GoRoute(
        path: 'tab1',
        builder: (context, state) => const Feature2Tab1Screen(),
      ),
      GoRoute(
        path: 'tab2',
        builder: (context, state) => const Feature2Tab2Screen(),
      ),
    ],
  ),
];
