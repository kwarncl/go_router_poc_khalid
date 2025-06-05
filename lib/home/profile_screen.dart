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

            /// Navigate to menu modal using absolute path
            /// This opens a fullscreen modal dialog over the current tab
            onPressed: () =>
                context.go('/profile/${MenuListScreenRouteData().location}'),
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

            /// Navigate to cart list using relative path from current location (/profile)
            /// Results in: /profile/cart
            onTap: () => context.go('./${CartListScreenRouteData().location}'),
          ),
          ListTile(
            title: const Text('View Item 1'),
            subtitle: const Text(
              'Go to item 1 PDP keeping Cart PLP in navigation stack',
            ),
            trailing: const Icon(Icons.arrow_forward),

            /// Navigate through cart list to item detail using relative path
            /// Results in: /profile/cart/details/1 (keeps cart list in nav stack)
            onTap: () => context.go(
              './${CartDetailScreenFromListRouteData(id: '1').location}',
            ),
          ),
          ListTile(
            title: const Text('View Item 2'),
            subtitle: const Text(
              'Go to item 2 PDP without keeping Cart PLP in navigation stack',
            ),
            trailing: const Icon(Icons.arrow_forward),

            /// Type-safe navigation to specific menu item
            onTap: () => context.go(
              './${CartDetailScreenDirectRouteData(id: '2').location}',
            ),
          ),
        ],
      ),
    );
  }
}
