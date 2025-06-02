import 'package:go_router/go_router.dart';

import 'screens/feature2_tab1_screen.dart';
import 'screens/feature2_tab2_screen.dart';
import 'screens/feature2_tabs_screen.dart';

enum Feature2Route {
  root('feature2'),
  tab1('tab1'),
  tab2('tab2');

  final String path;
  const Feature2Route(this.path);

  String location([Map<String, String> params = const {}]) {
    String location = path;
    if (params.isNotEmpty) {
      params.forEach((key, value) {
        location = location.replaceFirst(':$key', value);
      });
    }
    return location;
  }
}

/// Feature 2 route configuration
final feature2Routes = [
  GoRoute(
    path: Feature2Route.root.path,
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
