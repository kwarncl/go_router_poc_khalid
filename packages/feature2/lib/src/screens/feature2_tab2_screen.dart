import 'package:flutter/material.dart';

class Feature2Tab2Screen extends StatelessWidget {
  const Feature2Tab2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tab 2'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Text('This is Tab 2 content'),
      ),
    );
  }
}
