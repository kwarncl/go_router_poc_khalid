import 'package:flutter/material.dart';

class CartDetailScreen extends StatelessWidget {
  final String itemId;

  const CartDetailScreen({
    super.key,
    required this.itemId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart Item $itemId')),
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
                debugPrint('[CartDetailScreen] Adding item $itemId to cart');
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
