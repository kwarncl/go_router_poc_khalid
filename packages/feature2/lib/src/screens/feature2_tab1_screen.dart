import 'package:flutter/material.dart';

class Feature2Tab1Screen extends StatelessWidget {
  const Feature2Tab1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tab 1'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Text('This is Tab 1 content'),
      ),
    );
  }
}
