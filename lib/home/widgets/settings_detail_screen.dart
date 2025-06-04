import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsDetailScreen extends StatelessWidget {
  final String title;
  final String settingType;

  const SettingsDetailScreen({
    super.key,
    required this.title,
    required this.settingType,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title),
            Text(
              GoRouterState.of(context).fullPath ?? 'Unknown',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color:
                        Theme.of(context).primaryColor.withValues(alpha: 0.8),
                  ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Settings Detail',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'You are viewing details for: $title',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Setting Type: $settingType',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _getDetailContent(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('$title action completed!'),
                    ),
                  );
                },
                child: Text('Perform $title Action'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getDetailContent() {
    switch (settingType.toLowerCase()) {
      case 'account':
        return 'Manage your account information, profile details, and personal preferences. Here you can update your email, phone number, profile picture, and other account-related settings.';
      case 'security':
        return 'Configure security settings to protect your account. This includes password management, two-factor authentication, biometric authentication, and privacy controls.';
      case 'notifications':
        return 'Control how and when you receive notifications. Manage push notifications, email alerts, SMS notifications, and marketing preferences.';
      case 'about':
        return 'Learn more about the application, check version information, access help resources, and review legal documents like terms of service and privacy policy.';
      default:
        return 'This is a detailed view for the selected setting. Here you would typically find options to configure or modify the specific setting you selected.';
    }
  }
}
