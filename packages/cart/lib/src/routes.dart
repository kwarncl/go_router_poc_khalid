import 'package:cart/src/screens/cart_detail_screen.dart';
import 'package:cart/src/screens/cart_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'routes.g.dart';

/// Returns type-safe cart routes demonstrating different navigation patterns:
///
/// 1. Hierarchical: cart/details/:id (maintains cart list in stack)
/// 2. Direct: details/:id (bypasses cart list)
///
/// Both routes work in all tabs: /home/cart, /profile/cart, /settings/cart
/// Use type-safe navigation methods:
/// - CartListScreenRouteData().go(context) for hierarchical navigation
/// - CartDetailScreenDirectRouteData(id: 'id').go(context) for direct navigation
List<RouteBase> getCartRoutes([GlobalKey<NavigatorState>? parentNavigatorKey]) {
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

/// Cart list route - hierarchical entry point
@TypedGoRoute<CartListScreenRouteData>(
  path: 'cart',
  routes: [
    TypedGoRoute<CartDetailScreenFromListRouteData>(path: 'details/:id'),
  ],
)
@immutable
class CartListScreenRouteData extends GoRouteData {
  const CartListScreenRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CartListScreen();
  }
}

/// Cart detail route data (from list - hierarchical)
@immutable
class CartDetailScreenFromListRouteData extends GoRouteData {
  const CartDetailScreenFromListRouteData({required this.id});

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CartDetailScreen(itemId: id);
  }
}

/// Cart detail route (direct) - bypasses cart list
@TypedGoRoute<CartDetailScreenDirectRouteData>(path: 'details/:id')
@immutable
class CartDetailScreenDirectRouteData extends GoRouteData {
  const CartDetailScreenDirectRouteData({required this.id});

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CartDetailScreen(itemId: id);
  }
}
