import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color? textColor;
  final VoidCallback? onTap;

  const SettingsTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: textColor),
      title: Text(
        title,
        style: TextStyle(color: textColor),
      ),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap ??
          () {
            context.go('./detail?title=${Uri.encodeComponent(title)}');
          },
    );
  }
}
