import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartListScreen extends StatelessWidget {
  const CartListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('[CartListScreen] Building screen');
    final router = GoRouter.of(context);
    debugPrint('[CartListScreen] Can pop: ${router.canPop()}');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        automaticallyImplyLeading: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          final itemId = '${index + 1}';
          return ListTile(
            title: Text('Cart Item $itemId'),
            onTap: () {
              final targetPath = '/cart/item/$itemId';
              debugPrint('[CartListScreen] Navigating to: $targetPath');
              context.go(targetPath);
            },
          );
        },
      ),
    );
  }
}
