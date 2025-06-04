import 'package:cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:menu/menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.restaurant_menu),
            tooltip: 'Menu',

            /// Navigate to menu modal using absolute path
            /// This opens a fullscreen modal dialog over the current tab
            onPressed: () => context.go('/home/${MenuRoute.menuList.path}'),
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

            /// Navigate to cart list using relative path from current location (/home)
            /// Results in: /home/cart
            onTap: () => context.go('./${CartRoute.cartList.path}'),
          ),
          ListTile(
            title: const Text('View Item 1'),
            subtitle: const Text(
              'Goes to item 1 PDP keeping Cart PLP in navigation stack',
            ),
            trailing: const Icon(Icons.arrow_forward),

            /// Navigate through cart list to item detail using relative path
            /// Results in: /home/cart/details/1 (keeps cart list in nav stack)
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

            /// Navigate directly to item detail bypassing cart list
            /// Results in: /home/details/2 (no cart list in nav stack)
            onTap: () => context.go('./${CartRoute.cartDetail.path}/2'),
          ),
        ],
      ),
    );
  }
}
