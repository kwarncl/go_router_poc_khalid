// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// import 'screens/cart_detail_screen.dart';
// import 'screens/cart_list_screen.dart';
import 'package:cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum CartRoute {
  cartList('/cart'),
  cartDetail('/details/:id');

  final String path;
  const CartRoute(this.path);
}

List<GoRoute> getCartRoutes(GlobalKey<NavigatorState>? navigatorKey) {
  return [
    GoRoute(
      path: CartRoute.cartList.path,
      parentNavigatorKey: navigatorKey,
      builder: (context, state) {
        return const CartListScreen();
      },
      routes: [
        GoRoute(
          path: CartRoute.cartDetail.path,
          parentNavigatorKey: navigatorKey,
          builder: (context, state) {
            final itemId = state.pathParameters['id']!;
            return CartDetailScreen(itemId: itemId);
          },
        ),
      ],
    ),
    GoRoute(
      path: CartRoute.cartDetail.path,
      parentNavigatorKey: navigatorKey,
      builder: (context, state) {
        final itemId = state.pathParameters['id']!;
        return CartDetailScreen(itemId: itemId);
      },
    ),
  ];
}
