import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:menu/src/screens/menu_detail_screen.dart';
import 'package:menu/src/screens/menu_list_screen.dart';

part 'routes.g.dart';

/// Returns type-safe menu routes configured for modal presentation
///
/// The generated routes are enhanced with parentNavigatorKey for proper modal behavior.
/// Use type-safe navigation methods:
/// - MenuListScreenRouteData().go(context) for hierarchical navigation
/// - MenuDetailScreenDirectRouteData(id: 'id').go(context) for direct navigation
List<RouteBase> getMenuRoutes([GlobalKey<NavigatorState>? parentNavigatorKey]) {
  return $appRoutes.map((routeBase) {
    if (routeBase is GoRoute) {
      return GoRoute(
        path: routeBase.path,
        name: routeBase.name,
        builder: routeBase.builder,
        pageBuilder: routeBase.pageBuilder,
        parentNavigatorKey: parentNavigatorKey,
        redirect: routeBase.redirect,
        routes: routeBase.routes.map((subRoute) {
          if (subRoute is GoRoute) {
            return GoRoute(
              path: subRoute.path,
              name: subRoute.name,
              builder: subRoute.builder,
              pageBuilder: subRoute.pageBuilder,
              parentNavigatorKey: parentNavigatorKey,
              redirect: subRoute.redirect,
              routes: subRoute.routes,
            );
          }
          return subRoute;
        }).toList(),
      );
    }
    return routeBase;
  }).toList();
}

/// Menu list route - hierarchical entry point (modal)
@TypedGoRoute<MenuListScreenRouteData>(
  path: 'menu',
  routes: [
    TypedGoRoute<MenuDetailScreenFromListRouteData>(path: 'details/:id'),
  ],
)
@immutable
class MenuListScreenRouteData extends GoRouteData {
  const MenuListScreenRouteData();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(
      key: state.pageKey,
      child: build(context, state),
      fullscreenDialog: true,
    );
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MenuListScreen();
  }
}

/// Menu detail route data (from list - hierarchical modal)
@immutable
class MenuDetailScreenFromListRouteData extends GoRouteData {
  const MenuDetailScreenFromListRouteData({required this.id});

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MenuDetailScreen(itemId: id);
  }
}

/// Menu detail route (direct modal) - bypasses menu list
@TypedGoRoute<MenuDetailScreenDirectRouteData>(path: 'menudetails/:id')
@immutable
class MenuDetailScreenDirectRouteData extends GoRouteData {
  const MenuDetailScreenDirectRouteData({required this.id});

  final String id;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(
      key: state.pageKey,
      child: build(context, state),
      fullscreenDialog: true,
    );
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MenuDetailScreen(itemId: id);
  }
}
