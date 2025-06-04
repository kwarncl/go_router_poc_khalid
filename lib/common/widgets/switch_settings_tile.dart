import 'package:flutter/material.dart';

class SwitchSettingsTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SwitchSettingsTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
