import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartListScreen extends StatelessWidget {
  const CartListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart Items')),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          final itemId = '${index + 1}';
          return ListTile(
            title: Text('Cart Item $itemId'),
            onTap: () {
              context.go('/home/cart/details/$itemId');
            },
          );
        },
      ),
    );
  }
}
