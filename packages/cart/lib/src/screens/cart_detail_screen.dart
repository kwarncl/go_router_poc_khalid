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
    debugPrint('[CartDetailScreen] Building screen for item: $itemId');

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Item $itemId'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        automaticallyImplyLeading: true, // This ensures back button shows up
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
            ElevatedButton(
              onPressed: () {
                debugPrint('[CartDetailScreen] Adding item $itemId to cart');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Added item $itemId to cart')),
                );
              },
              child: const Text('Add to Cart'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                debugPrint(
                    '[CartDetailScreen] Popping back to previous screen');
                context.pop();
              },
              child: const Text('Back to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
