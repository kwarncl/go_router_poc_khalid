import 'package:flutter/material.dart';
import '../../common/widgets/settings_section.dart';
import '../../common/widgets/settings_tile.dart';

class SecuritySettingsScreen extends StatelessWidget {
  const SecuritySettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SettingsSection(
          title: 'Authentication',
          children: [
            SettingsTile(
              title: 'Change Password',
              subtitle: 'Update your account password',
              icon: Icons.lock,
            ),
            SettingsTile(
              title: 'Two-Factor Authentication',
              subtitle: 'Add an extra layer of security',
              icon: Icons.security,
            ),
            SettingsTile(
              title: 'Biometric Login',
              subtitle: 'Use fingerprint or face ID',
              icon: Icons.fingerprint,
            ),
          ],
        ),
        const SettingsSection(
          title: 'Privacy',
          children: [
            SettingsTile(
              title: 'Privacy Settings',
              subtitle: 'Manage your data and privacy',
              icon: Icons.privacy_tip,
            ),
            SettingsTile(
              title: 'Data Export',
              subtitle: 'Download your personal data',
              icon: Icons.download,
            ),
            SettingsTile(
              title: 'Delete Account',
              subtitle: 'Permanently delete your account',
              icon: Icons.delete_forever,
              textColor: Colors.red,
            ),
          ],
        ),
      ],
    );
  }
}
