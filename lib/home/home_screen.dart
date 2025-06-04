import 'package:cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:menu/menu.dart';
import '../router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Home'),
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
            onPressed: () => context.go('/home/${MenuRoute.menuList.path}'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Cart Navigation',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Card(
              child: Column(
                children: [
                  ListTile(
                    dense: true,
                    title: const Text('View Cart'),
                    subtitle: const Text('Go to cart items list'),
                    trailing: const Icon(Icons.shopping_cart),

                    /// Navigate to cart list using relative path from current location (/home)
                    /// Results in: /home/cart
                    onTap: () => context.go('./${CartRoute.cartList.path}'),
                  ),
                  ListTile(
                    dense: true,
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
                    dense: true,
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
            ),
            const SizedBox(height: 24),
            Text(
              'Menu Navigation',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Card(
              child: Column(
                children: [
                  ListTile(
                    dense: true,
                    leading: const Icon(Icons.restaurant_menu),
                    title: const Text('View Menu'),
                    subtitle: const Text('Browse restaurant menu items'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => context.go('/home/${MenuRoute.menuList.path}'),
                  ),
                  ListTile(
                    dense: true,
                    leading: const Icon(Icons.fastfood),
                    title: const Text('Menu Item 4'),
                    subtitle: const Text('Go directly to menu item 4 details'),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () => context.go(
                        '/home/${MenuRoute.menuList.path}/${MenuRoute.menuDetail.path}/4'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Direct Settings Navigation',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Navigate directly to specific settings subpages',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).textTheme.bodySmall?.color,
                  ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Column(
                children: [
                  ListTile(
                    dense: true,
                    leading: const Icon(Icons.person),
                    title: const Text('Account Settings'),
                    subtitle: const Text('Go directly to account tab'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => context.go(AppRoute.settingsAccount.path),
                  ),
                  ListTile(
                    dense: true,
                    leading: const Icon(Icons.notifications),
                    title: const Text('Notification Settings'),
                    subtitle: const Text('Go directly to notifications tab'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () =>
                        context.go(AppRoute.settingsNotifications.path),
                  ),
                  ListTile(
                    dense: true,
                    leading: const Icon(Icons.security),
                    title: const Text('Security Settings'),
                    subtitle: const Text('Go directly to security tab'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => context.go(AppRoute.settingsSecurity.path),
                  ),
                  ListTile(
                    dense: true,
                    leading: const Icon(Icons.info),
                    title: const Text('About'),
                    subtitle: const Text('Go directly to about tab'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => context.go(AppRoute.settingsAbout.path),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
