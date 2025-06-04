import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartDetailScreen extends StatelessWidget {
  final String itemId;

  const CartDetailScreen({
    super.key,
    required this.itemId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Cart Item $itemId'),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Cart item $itemId details',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Added item $itemId to cart')),
                );
              },
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
