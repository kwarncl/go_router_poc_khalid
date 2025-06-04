import 'package:cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_poc_khalid/common/error_screen.dart';
import 'package:go_router_poc_khalid/common/home_container.dart';
import 'package:menu/menu.dart';

import 'home/home_screen.dart';
import 'home/profile_screen.dart';
import 'home/settings_screen.dart';
import 'home/splash_screen.dart';

// Root navigator key for the entire app
final rootNavigatorKey = GlobalKey<NavigatorState>();

enum AppRoute {
  splash('/'),

  /// Stateful Shell
  home('/home'),
  profile('/profile'),
  settings('/settings');

  final String path;
  const AppRoute(this.path);
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
        return HomeContainer(navigationShell: navigationShell);
      },
      parentNavigatorKey: rootNavigatorKey,
      branches: [
        /// Home branch
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoute.home.path,
              builder: (context, state) => const HomeScreen(),
              routes: [
                ...getCartRoutes(rootNavigatorKey),
                ...getMenuRoutes(rootNavigatorKey),
              ],
            ),
          ],
        ),

        /// Profile branch
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoute.profile.path,
              builder: (context, state) => const ProfileScreen(),
              routes: [
                ...getCartRoutes(rootNavigatorKey),
                ...getMenuRoutes(rootNavigatorKey),
              ],
            ),
          ],
        ),

        /// Settings branch
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoute.settings.path,
              builder: (context, state) => const SettingsScreen(),
              routes: [
                ...getCartRoutes(rootNavigatorKey),
                ...getMenuRoutes(rootNavigatorKey),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
