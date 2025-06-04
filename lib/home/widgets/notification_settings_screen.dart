import 'package:flutter/material.dart';
import '../../common/widgets/settings_section.dart';
import '../../common/widgets/switch_settings_tile.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool pushNotifications = true;
  bool emailNotifications = false;
  bool smsNotifications = true;
  bool marketingEmails = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SettingsSection(
          title: 'Push Notifications',
          children: [
            SwitchSettingsTile(
              title: 'Enable Push Notifications',
              subtitle: 'Receive notifications on your device',
              icon: Icons.notifications,
              value: pushNotifications,
              onChanged: (bool value) {
                setState(() {
                  pushNotifications = value;
                });
              },
            ),
          ],
        ),
        SettingsSection(
          title: 'Email & SMS',
          children: [
            SwitchSettingsTile(
              title: 'Email Notifications',
              subtitle: 'Receive important updates via email',
              icon: Icons.email,
              value: emailNotifications,
              onChanged: (bool value) {
                setState(() {
                  emailNotifications = value;
                });
              },
            ),
            SwitchSettingsTile(
              title: 'SMS Notifications',
              subtitle: 'Receive urgent alerts via SMS',
              icon: Icons.sms,
              value: smsNotifications,
              onChanged: (bool value) {
                setState(() {
                  smsNotifications = value;
                });
              },
            ),
          ],
        ),
        SettingsSection(
          title: 'Marketing',
          children: [
            SwitchSettingsTile(
              title: 'Marketing Emails',
              subtitle: 'Receive promotional offers and updates',
              icon: Icons.campaign,
              value: marketingEmails,
              onChanged: (bool value) {
                setState(() {
                  marketingEmails = value;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
