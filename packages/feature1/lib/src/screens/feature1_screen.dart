import 'package:flutter/material.dart';

class Feature1Screen extends StatelessWidget {
  const Feature1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Feature 1'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Text('Welcome to Feature 1'),
      ),
    );
  }
}
