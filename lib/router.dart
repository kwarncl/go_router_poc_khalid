import 'package:cart/cart.dart';
import 'package:feature2/feature2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_poc_khalid/common/error_screen.dart';

import 'home/home_screen.dart';
import 'home/profile_screen.dart';
import 'home/settings_screen.dart';
import 'home/splash_screen.dart';

// Root navigator key for the entire app
final rootNavigatorKey = GlobalKey<NavigatorState>();
// final _shellNavigatorKey = GlobalKey<NavigatorState>();

enum AppRoute {
  splash('/'),
  home('/home'),
  profile('/profile'),
  settings('/settings');

  final String path;
  const AppRoute(this.path);

  String location([Map<String, String> params = const {}]) {
    String location = path;
    if (params.isNotEmpty) {
      params.forEach((key, value) {
        location = location.replaceFirst(':$key', value);
      });
    }
    return location;
  }
}

final router = GoRouter(
  initialLocation: '/',
  navigatorKey: rootNavigatorKey,
  errorBuilder: (context, state) => ErrorScreen(),
  debugLogDiagnostics: true,
  routes: [
    /// Splash route
    GoRoute(
      path: AppRoute.splash.path,
      builder: (context, state) => const SplashScreen(),
    ),

    /// Home route with Bottom Navigation Bar and pages
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return Scaffold(
          body: navigationShell,
          bottomNavigationBar: NavigationBar(
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: navigationShell.goBranch,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
              NavigationDestination(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        );
      },
      branches: [
        /// Home branch
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoute.home.path,
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),

        /// Profile branch
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoute.profile.path,
              builder: (context, state) => const ProfileScreen(),
            ),
          ],
        ),

        /// Settings branch
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoute.settings.path,
              builder: (context, state) => const SettingsScreen(),
            ),
          ],
        ),
      ],
    ),

    /// Cart routes
    ...cartRoutes,

    /// Feature 2 routes
    ...feature2Routes,
  ],
);
