import 'package:cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:menu/menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Profile'),
            Text(
              GoRouterState.of(context).fullPath ?? 'Unknown',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color:
                        Theme.of(context).primaryColor.withValues(alpha: 0.8),
                  ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.restaurant_menu),
            tooltip: 'Menu',
            onPressed: () => context.go('./${MenuRoute.menuList.path}'),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Cart Navigation',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          ListTile(
            title: const Text('View Cart'),
            subtitle: const Text('Go to cart items list'),
            trailing: const Icon(Icons.shopping_cart),
            onTap: () => context.go('./${CartRoute.cartList.path}'),
          ),
          ListTile(
            title: const Text('View Item 1'),
            subtitle: const Text(
              'Goes to item 1 PDP keeping Cart PLP in navigation stack',
            ),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => context.go(
              './${CartRoute.cartList.path}/${CartRoute.cartDetail.path}/1',
            ),
          ),
          ListTile(
            title: const Text('View Item 2'),
            subtitle: const Text(
              'Go to item 2 PDP, without keeping Cart PLP in navigation stack',
            ),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => context.go('./${CartRoute.cartDetail.path}/2'),
          ),
        ],
      ),
    );
  }
}
