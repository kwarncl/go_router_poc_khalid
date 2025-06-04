import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartNavigationTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String route;

  const CartNavigationTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => context.go(route),
    );
  }
}
