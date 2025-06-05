import 'package:cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:menu/menu.dart';
import '../routes/routes.dart';

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
            onPressed: () =>
                context.go('/home/${MenuListScreenRouteData().location}'),
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
                    onTap: () =>
                        context.go('./${CartListScreenRouteData().location}'),
                  ),
                  ListTile(
                    dense: true,
                    title: const Text('View Item 1'),
                    subtitle: const Text(
                      'Go to item 1 PDP keeping Cart PLP in navigation stack',
                    ),
                    trailing: const Icon(Icons.arrow_forward),

                    /// Navigate through cart list to item detail using relative path
                    /// Results in: /home/cart/details/1 (keeps cart list in nav stack)
                    onTap: () => context.go(
                      './${CartDetailScreenFromListRouteData(id: '1').location}',
                    ),
                  ),
                  ListTile(
                    dense: true,
                    title: const Text('View Item 2'),
                    subtitle: const Text(
                      'Go to item 2 PDP without keeping Cart PLP in navigation stack',
                    ),
                    trailing: const Icon(Icons.arrow_forward),

                    /// Type-safe navigation directly to item detail bypassing cart list
                    /// Results in: /details/2 (no cart list in nav stack)
                    onTap: () => context.go(
                      './${CartDetailScreenDirectRouteData(id: '2').location}',
                    ),
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

                    /// Type-safe navigation to menu
                    onTap: () =>
                        context.go('./${MenuListScreenRouteData().location}'),
                  ),
                  ListTile(
                    dense: true,
                    leading: const Icon(Icons.fastfood),
                    title: const Text('Menu Item 4'),
                    subtitle: const Text(
                      'Go to menu item 4 PDP keeping Menu PLP in navigation stack',
                    ),
                    trailing: const Icon(Icons.arrow_forward),

                    /// Type-safe navigation to specific menu item
                    onTap: () => context.go(
                      './${MenuDetailScreenFromListRouteData(id: '4').location}',
                    ),
                  ),
                  ListTile(
                    dense: true,
                    leading: const Icon(Icons.fastfood),
                    title: const Text('Menu Item 5'),
                    subtitle: const Text(
                      'Go to Menu item 5 PDP without keeping Menu PLP in navigation stack',
                    ),
                    trailing: const Icon(Icons.arrow_forward),

                    /// Type-safe navigation to specific menu item
                    onTap: () => context.go(
                      './${MenuDetailScreenDirectRouteData(id: '5').location}',
                    ),
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

                    /// Type-safe navigation to settings account
                    onTap: () =>
                        context.go(AccountSettingsScreenRouteData().location),
                  ),
                  ListTile(
                    dense: true,
                    leading: const Icon(Icons.notifications),
                    title: const Text('Notification Settings'),
                    subtitle: const Text('Go directly to notifications tab'),
                    trailing: const Icon(Icons.chevron_right),

                    /// Type-safe navigation to settings notifications
                    onTap: () => context
                        .go(NotificationSettingsScreenRouteData().location),
                  ),
                  ListTile(
                    dense: true,
                    leading: const Icon(Icons.security),
                    title: const Text('Security Settings'),
                    subtitle: const Text('Go directly to security tab'),
                    trailing: const Icon(Icons.chevron_right),

                    /// Type-safe navigation to settings security
                    onTap: () =>
                        context.go(SecuritySettingsScreenRouteData().location),
                  ),
                  ListTile(
                    dense: true,
                    leading: const Icon(Icons.info),
                    title: const Text('About'),
                    subtitle: const Text('Go directly to about tab'),
                    trailing: const Icon(Icons.chevron_right),

                    /// Type-safe navigation to settings about
                    onTap: () =>
                        context.go(AboutSettingsScreenRouteData().location),
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
