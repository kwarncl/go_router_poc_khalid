import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartListScreen extends StatelessWidget {
  const CartListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Cart Items'),
            Text(
              GoRouterState.of(context).fullPath ?? 'Unknown',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color:
                        Theme.of(context).primaryColor.withValues(alpha: 0.8),
                  ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          final itemId = '${index + 1}';
          return ListTile(
            title: Text('Cart Item $itemId'),
            onTap: () {
              /// Navigate to detail using relative path
              /// Results in: /current_path/details/$itemId
              context.go('./details/$itemId');
            },
          );
        },
      ),
    );
  }
}
