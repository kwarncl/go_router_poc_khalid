import 'package:flutter/material.dart';
import 'package:menu/menu.dart';

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
            /// Close the modal and return to the originating tab
            onPressed: () => MenuRoute.returnToOriginatingTab(context),
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
                color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.restaurant_menu),
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
