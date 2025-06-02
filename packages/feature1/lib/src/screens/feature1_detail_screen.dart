import 'package:flutter/material.dart';

class Feature1DetailScreen extends StatelessWidget {
  final String itemId;

  const Feature1DetailScreen({
    super.key,
    required this.itemId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item $itemId Details'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Details for item $itemId',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            const Text('This is a detailed view of the item'),
          ],
        ),
      ),
    );
  }
}
