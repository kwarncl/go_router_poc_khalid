import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuListScreen extends StatelessWidget {
  const MenuListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Items'),
        actions: [
          IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.close),
            tooltip: 'Close',
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 20,
        itemBuilder: (context, index) {
          final itemId = '${index + 1}';
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              title: Text('Menu Item $itemId'),
              subtitle: Text('Delicious menu item #$itemId'),
              leading: CircleAvatar(
                backgroundColor:
                    Theme.of(context).primaryColor.withOpacity(0.2),
                child: Icon(
                  Icons.restaurant_menu,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => context.go('./details/$itemId'),
            ),
          );
        },
      ),
    );
  }
}
