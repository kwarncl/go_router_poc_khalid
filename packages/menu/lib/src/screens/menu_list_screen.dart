import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuListScreen extends StatelessWidget {
  const MenuListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Items'),
        actions: [
          IconButton(
            /// Close the entire modal shell and return to home tab
            /// Uses absolute path to dismiss modal and navigate to home root
            onPressed: () => context.go('/home'),
            icon: const Icon(Icons.close),
            tooltip: 'Close',
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 20,
        itemBuilder: (context, index) {
          /// Special handling for first 3 items - these navigate to different tabs
          if (index == 0) {
            return Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                title: const Text('Home'),
                subtitle: const Text('Go to Home tab'),
                leading: CircleAvatar(
                  backgroundColor:
                      Theme.of(context).primaryColor.withValues(alpha: 0.2),
                  child: Icon(
                    Icons.home,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),

                /// Dismiss modal and navigate to Home tab using absolute path
                /// This ensures clean navigation without path resolution issues
                onTap: () => context.go('/home'),
              ),
            );
          }

          if (index == 1) {
            return Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                title: const Text('Profile'),
                subtitle: const Text('Go to Profile tab'),
                leading: CircleAvatar(
                  backgroundColor:
                      Theme.of(context).primaryColor.withValues(alpha: 0.2),
                  child: Icon(
                    Icons.person,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),

                /// Dismiss modal and navigate to Profile tab using absolute path
                /// This ensures clean navigation without path resolution issues
                onTap: () => context.go('/profile'),
              ),
            );
          }

          if (index == 2) {
            return Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                title: const Text('Settings'),
                subtitle: const Text('Go to Settings tab'),
                leading: CircleAvatar(
                  backgroundColor:
                      Theme.of(context).primaryColor.withValues(alpha: 0.2),
                  child: Icon(
                    Icons.settings,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),

                /// Dismiss modal and navigate to Settings tab using absolute path
                /// This ensures clean navigation without path resolution issues
                onTap: () => context.go('/settings'),
              ),
            );
          }

          /// Dummy data for remaining items - these navigate to detail screens within the modal
          final itemId = '${index + 1}';
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              title: Text('Menu Item $itemId'),
              subtitle: Text('Delicious menu item #$itemId'),
              leading: CircleAvatar(
                backgroundColor:
                    Theme.of(context).primaryColor.withValues(alpha: 0.2),
                child: Icon(
                  Icons.restaurant_menu,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),

              /// Navigate to detail screen within the modal using relative path
              /// This stays within the same modal shell and doesn't dismiss it
              /// Results in: /home/menu/details/{itemId}
              onTap: () => context.go('./details/$itemId'),
            ),
          );
        },
      ),
    );
  }
}
