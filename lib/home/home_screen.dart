import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Go Router Demo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Shopping Cart',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          ListTile(
            title: const Text('View Cart'),
            subtitle: const Text('Go to cart items list'),
            trailing: const Icon(Icons.shopping_cart),
            onTap: () => context.go('/home/cart'),
          ),
          ListTile(
            title: const Text('View Item 1'),
            subtitle: const Text('Go directly to item 1 details'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => context.go('/home/cart/details/1'),
          ),
          ListTile(
            title: const Text('View Item 2'),
            subtitle: const Text('Go directly to item 2 details'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => context.go('/details/2'),
          ),
        ],
      ),
    );
  }
}
