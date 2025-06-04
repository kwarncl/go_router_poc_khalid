import 'package:cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum CartRoute {
  cartList('cart'),
  cartDetail('details');

  final String path;
  const CartRoute(this.path);
}

/// Creates cart routes demonstrating different navigation patterns:
///
/// 1. Hierarchical: /cart/details/:id (maintains cart list in stack)
/// 2. Direct: /details/:id (bypasses cart list)
///
/// Both routes work in all tabs: /home/cart, /profile/cart, /settings/cart
List<GoRoute> getCartRoutes(GlobalKey<NavigatorState>? navigatorKey) {
  return [
    /// Hierarchical route: Cart List → Cart Detail
    GoRoute(
      path: CartRoute.cartList.path,
      parentNavigatorKey: navigatorKey,
      builder: (context, state) {
        return const CartListScreen();
      },
      routes: [
        /// Nested detail: /cart/details/:id
        GoRoute(
          path: '${CartRoute.cartDetail.path}/:id',
          parentNavigatorKey: navigatorKey,
          builder: (context, state) {
            final itemId = state.pathParameters['id']!;
            return CartDetailScreen(itemId: itemId);
          },
        ),
      ],
    ),

    /// Direct route: bypasses cart list
    /// Route: /details/:id
    GoRoute(
      path: '${CartRoute.cartDetail.path}/:id',
      parentNavigatorKey: navigatorKey,
      builder: (context, state) {
        final itemId = state.pathParameters['id']!;
        return CartDetailScreen(itemId: itemId);
      },
    ),
  ];
}
