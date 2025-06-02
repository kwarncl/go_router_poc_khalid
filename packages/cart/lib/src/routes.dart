import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import 'screens/cart_detail_screen.dart';
import 'screens/cart_list_screen.dart';

enum CartRoute {
  cartList('/cart'),
  cartDetail('/cart/item/:id'); // Using full path instead of nesting

  final String path;
  const CartRoute(this.path);

  String location([Map<String, String> params = const {}]) {
    if (params.isEmpty) return path;
    return params.entries.fold(
        path, (path, param) => path.replaceFirst(':${param.key}', param.value));
  }
}

/// Cart route configuration with parallel routes instead of nesting
final cartRoutes = [
  GoRoute(
    path: CartRoute.cartList.path,
    builder: (context, state) {
      debugPrint('[CartRoute] Building CartListScreen, state: ${state.uri}');
      return const CartListScreen();
    },
  ),
  GoRoute(
    path: CartRoute.cartDetail.path,
    builder: (context, state) {
      final itemId = state.pathParameters['id']!;
      debugPrint(
          '[CartRoute] Building CartDetailScreen for item: $itemId, state: ${state.uri}');
      return CartDetailScreen(itemId: itemId);
    },
  ),
];
