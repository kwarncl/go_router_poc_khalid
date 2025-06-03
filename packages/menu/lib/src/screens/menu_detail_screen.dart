import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuDetailScreen extends StatelessWidget {
  final String itemId;

  const MenuDetailScreen({
    super.key,
    required this.itemId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Menu Item $itemId'),
        actions: [
          IconButton(
            onPressed: () {
              final StatefulNavigationShellState? navigationShell =
                  StatefulNavigationShell.maybeOf(context);

              if (navigationShell != null) {
                // Use the built-in goBranch method with initialLocation to go to root
                navigationShell.goBranch(
                  navigationShell.currentIndex,
                  initialLocation: true,
                );
              }
            },
            icon: const Icon(Icons.close),
            tooltip: 'Close',
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.restaurant_menu),
            ),
            Text(
              'Menu Item $itemId',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              'This is the detailed view for menu item $itemId',
            ),
          ],
        ),
      ),
    );
  }
}
