import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:menu/menu.dart';

enum MenuRoute {
  menuList('menu'),
  menuDetail('details');

  final String path;
  const MenuRoute(this.path);
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
