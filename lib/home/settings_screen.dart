import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:menu/menu.dart';

class SettingsScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const SettingsScreen({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Settings'),
            Text(
              GoRouterState.of(context).fullPath ?? 'Unknown',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color:
                        Theme.of(context).primaryColor.withValues(alpha: 0.8),
                  ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.restaurant_menu),
            tooltip: 'Menu',

            /// Navigate to menu modal using relative path from current settings tab
            /// This opens a fullscreen modal dialog over the current tab
            onPressed: () =>
                context.go('./${MenuListScreenRouteData().location}'),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: SizedBox(
            height: 56,
            child: Row(
              children: [
                Expanded(
                  child: _TabButton(
                    label: 'Account',
                    icon: Icons.person,
                    isSelected: navigationShell.currentIndex == 0,
                    onTap: () => navigationShell.goBranch(
                      0,
                      initialLocation: 0 == navigationShell.currentIndex,
                    ),
                  ),
                ),
                Expanded(
                  child: _TabButton(
                    label: 'Notifications',
                    icon: Icons.notifications,
                    isSelected: navigationShell.currentIndex == 1,
                    onTap: () => navigationShell.goBranch(
                      1,
                      initialLocation: 1 == navigationShell.currentIndex,
                    ),
                  ),
                ),
                Expanded(
                  child: _TabButton(
                    label: 'Security',
                    icon: Icons.security,
                    isSelected: navigationShell.currentIndex == 2,
                    onTap: () => navigationShell.goBranch(
                      2,
                      initialLocation: 2 == navigationShell.currentIndex,
                    ),
                  ),
                ),
                Expanded(
                  child: _TabButton(
                    label: 'About',
                    icon: Icons.info,
                    isSelected: navigationShell.currentIndex == 3,
                    onTap: () => navigationShell.goBranch(
                      3,
                      initialLocation: 3 == navigationShell.currentIndex,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: navigationShell,
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabButton({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = isSelected ? theme.primaryColor : theme.unselectedWidgetColor;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18, color: color),
            const SizedBox(height: 4),
            Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: color,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                fontSize: 11,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
