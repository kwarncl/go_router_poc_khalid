import 'package:flutter/material.dart';
import '../../common/widgets/settings_section.dart';
import '../../common/widgets/settings_tile.dart';

class AboutSettingsScreen extends StatelessWidget {
  const AboutSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SettingsSection(
          title: 'App Information',
          children: [
            SettingsTile(
              title: 'Version',
              subtitle: '1.0.0 (Build 123)',
              icon: Icons.info,
            ),
            SettingsTile(
              title: 'Release Notes',
              subtitle: 'What\'s new in this version',
              icon: Icons.article,
            ),
            SettingsTile(
              title: 'Check for Updates',
              subtitle: 'Get the latest version',
              icon: Icons.system_update,
            ),
          ],
        ),
        const SettingsSection(
          title: 'Support',
          children: [
            SettingsTile(
              title: 'Help Center',
              subtitle: 'Get help and find answers',
              icon: Icons.help,
            ),
            SettingsTile(
              title: 'Contact Support',
              subtitle: 'Get in touch with our team',
              icon: Icons.support_agent,
            ),
            SettingsTile(
              title: 'Report a Bug',
              subtitle: 'Help us improve the app',
              icon: Icons.bug_report,
            ),
          ],
        ),
        const SettingsSection(
          title: 'Legal',
          children: [
            SettingsTile(
              title: 'Terms of Service',
              subtitle: 'Read our terms and conditions',
              icon: Icons.description,
            ),
            SettingsTile(
              title: 'Privacy Policy',
              subtitle: 'How we handle your data',
              icon: Icons.policy,
            ),
            SettingsTile(
              title: 'Open Source Licenses',
              subtitle: 'Third-party software licenses',
              icon: Icons.code,
            ),
          ],
        ),
      ],
    );
  }
}
