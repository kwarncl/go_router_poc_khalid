import 'package:cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_poc_khalid/common/error_screen.dart';
import 'package:go_router_poc_khalid/common/home_container.dart';
import 'package:go_router_poc_khalid/home/widgets/about_settings_screen.dart';
import 'package:go_router_poc_khalid/home/widgets/account_settings_screen.dart';
import 'package:go_router_poc_khalid/home/widgets/notification_settings_screen.dart';
import 'package:go_router_poc_khalid/home/widgets/security_settings_screen.dart';
import 'package:go_router_poc_khalid/home/widgets/settings_detail_screen.dart';
import 'package:menu/menu.dart';

import 'home/home_screen.dart';
import 'home/profile_screen.dart';
import 'home/settings_screen.dart';
import 'home/splash_screen.dart';

// Navigator keys for the app
final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

enum AppRoute {
  splash('/'),

  /// Stateful Shell routes
  home('/home'),
  profile('/profile'),
  settings('/settings'),

  /// Settings subpages
  settingsAccount('/settings/account'),
  settingsNotifications('/settings/notifications'),
  settingsSecurity('/settings/security'),
  settingsAbout('/settings/about'),

  /// Settings detail
  settingsDetail('detail');

  final String path;
  const AppRoute(this.path);
}

final router = GoRouter(
  initialLocation: AppRoute.splash.path,
  navigatorKey: rootNavigatorKey,
  errorBuilder: (context, state) => const ErrorScreen(),
  debugLogDiagnostics: true,
  routes: [
    /// Splash route - outside of shell
    GoRoute(
      path: AppRoute.splash.path,
      builder: (context, state) => const SplashScreen(),
    ),

    /// Stateful Shell route with Bottom Navigation Bar and pages
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

        /// Settings branch with nested tabs
        StatefulShellBranch(
          routes: [
            /// Nested StatefulShellRoute for settings tabs
            StatefulShellRoute.indexedStack(
              builder: (context, state, settingsNavigationShell) {
                return SettingsScreen(navigationShell: settingsNavigationShell);
              },
              branches: [
                /// Account settings branch
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      path: AppRoute.settingsAccount.path,
                      builder: (context, state) =>
                          const AccountSettingsScreen(),
                      routes: [
                        GoRoute(
                          path: AppRoute.settingsDetail.path,
                          parentNavigatorKey: rootNavigatorKey,
                          builder: (context, state) {
                            final title =
                                state.uri.queryParameters['title'] ?? 'Setting';
                            return SettingsDetailScreen(
                              title: title,
                              settingType: 'account',
                            );
                          },
                        ),
                        ...getCartRoutes(rootNavigatorKey),
                      ],
                    ),
                  ],
                ),

                /// Notification settings branch
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      path: AppRoute.settingsNotifications.path,
                      builder: (context, state) =>
                          const NotificationSettingsScreen(),
                      routes: [
                        GoRoute(
                          path: AppRoute.settingsDetail.path,
                          parentNavigatorKey: rootNavigatorKey,
                          builder: (context, state) {
                            final title =
                                state.uri.queryParameters['title'] ?? 'Setting';
                            return SettingsDetailScreen(
                              title: title,
                              settingType: 'notifications',
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),

                /// Security settings branch
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      path: AppRoute.settingsSecurity.path,
                      builder: (context, state) =>
                          const SecuritySettingsScreen(),
                      routes: [
                        GoRoute(
                          path: AppRoute.settingsDetail.path,
                          parentNavigatorKey: rootNavigatorKey,
                          builder: (context, state) {
                            final title =
                                state.uri.queryParameters['title'] ?? 'Setting';
                            return SettingsDetailScreen(
                              title: title,
                              settingType: 'security',
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),

                /// About settings branch
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      path: AppRoute.settingsAbout.path,
                      builder: (context, state) => const AboutSettingsScreen(),
                      routes: [
                        GoRoute(
                          path: AppRoute.settingsDetail.path,
                          parentNavigatorKey: rootNavigatorKey,
                          builder: (context, state) {
                            final title =
                                state.uri.queryParameters['title'] ?? 'Setting';
                            return SettingsDetailScreen(
                              title: title,
                              settingType: 'about',
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
