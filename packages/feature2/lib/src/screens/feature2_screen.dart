import 'package:flutter/material.dart';

class Feature2Screen extends StatelessWidget {
  const Feature2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feature 2'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Text('Welcome to Feature 2'),
      ),
    );
  }
}
