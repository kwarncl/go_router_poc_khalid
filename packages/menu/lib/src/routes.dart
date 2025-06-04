import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:menu/menu.dart';

enum MenuRoute {
  menuList('menu'),
  menuDetail('details');

  final String path;
  const MenuRoute(this.path);

  /// Returns to the originating tab that opened the menu modal
  /// Parses the current route to determine which tab to navigate back to
  static void returnToOriginatingTab(BuildContext context) {
    final targetRoute = switch (GoRouterState.of(context).fullPath) {
      String path when path.contains('/home/') => '/home',
      String path when path.contains('/profile/') => '/profile',
      String path when path.contains('/settings/') => '/settings',
      _ => '/home',
    };

    context.go(targetRoute);
  }
}

List<RouteBase> getMenuRoutes([GlobalKey<NavigatorState>? navigatorKey]) {
  return [
    // Use ShellRoute for modal navigation with internal routing
    ShellRoute(
      parentNavigatorKey: navigatorKey,
      pageBuilder: (context, state, child) {
        return MaterialPage(
          key: state.pageKey,
          child: child,
          fullscreenDialog: true,
        );
      },
      routes: [
        GoRoute(
          path: MenuRoute.menuList.path,
          builder: (context, state) => const MenuListScreen(),
          routes: [
            GoRoute(
              path: '${MenuRoute.menuDetail.path}/:id',
              builder: (context, state) {
                final itemId = state.pathParameters['id']!;
                return MenuDetailScreen(itemId: itemId);
              },
            ),
          ],
        ),
      ],
    ),
  ];
}
