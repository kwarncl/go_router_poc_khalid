import 'package:cart/cart.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/settings_section.dart';
import '../../common/widgets/settings_tile.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SettingsSection(
          title: 'Profile Information',
          children: [
            SettingsTile(
              title: 'Edit Profile',
              subtitle: 'Update your personal information',
              icon: Icons.edit,
            ),
            SettingsTile(
              title: 'Change Avatar',
              subtitle: 'Update your profile picture',
              icon: Icons.photo_camera,
            ),
          ],
        ),
        const SettingsSection(
          title: 'Account Management',
          children: [
            SettingsTile(
              title: 'Email Address',
              subtitle: 'user@example.com',
              icon: Icons.email,
            ),
            SettingsTile(
              title: 'Phone Number',
              subtitle: '+1 (555) 123-4567',
              icon: Icons.phone,
            ),
            SettingsTile(
              title: 'Language',
              subtitle: 'English',
              icon: Icons.language,
            ),
          ],
        ),
        SettingsSection(
          title: 'Cart Navigation Demo',
          children: [
            SettingsTile(
              title: 'View Cart',
              subtitle: 'Go to cart items list',
              icon: Icons.shopping_cart,
              onTap: () => const CartListScreenRouteData().go(context),
            ),
            SettingsTile(
              title: 'View Item 1',
              subtitle:
                  'Goes to item 1 PDP keeping Cart PLP in navigation stack',
              icon: Icons.arrow_forward,
              onTap: () =>
                  const CartDetailScreenFromListRouteData(id: '1').go(context),
            ),
            SettingsTile(
              title: 'View Item 2',
              subtitle:
                  'Go to item 2 PDP, without keeping Cart PLP in navigation stack',
              icon: Icons.arrow_forward,
              onTap: () =>
                  const CartDetailScreenDirectRouteData(id: '2').go(context),
            ),
          ],
        ),
      ],
    );
  }
}
