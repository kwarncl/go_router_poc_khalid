import 'package:cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_poc_khalid/common/error_screen.dart';
import 'package:go_router_poc_khalid/common/home_container.dart';
import 'package:go_router_poc_khalid/home/settings_screen.dart';
import 'package:go_router_poc_khalid/routes/routes.dart';
import 'package:menu/menu.dart';

// Navigator keys for the app
final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

/// Type-safe router configuration using generated routes consistently
final router = GoRouter(
  initialLocation: const SplashScreenRouteData().location,
  navigatorKey: rootNavigatorKey,
  errorBuilder: (context, state) => const ErrorScreen(),
  debugLogDiagnostics: true,
  routes: [
    /// Main app routes are fully type-safe with proper generation
    $splashScreenRouteData,

    /// Stateful Shell route with Bottom Navigation Bar and pages
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return HomeContainer(navigationShell: navigationShell);
      },
      parentNavigatorKey: rootNavigatorKey,
      branches: [
        /// Home branch with package routes integration
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: const HomeScreenRouteData().location,
              builder: (context, state) =>
                  const HomeScreenRouteData().build(context, state),
              routes: [
                ...getCartRoutes(rootNavigatorKey),
                ...getMenuRoutes(rootNavigatorKey),
              ],
            ),
          ],
        ),

        /// Profile branch with package routes integration
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: const ProfileScreenRouteData().location,
              builder: (context, state) =>
                  const ProfileScreenRouteData().build(context, state),
              routes: [
                ...getCartRoutes(rootNavigatorKey),
                ...getMenuRoutes(rootNavigatorKey),
              ],
            ),
          ],
        ),

        /// Settings branch with nested tabs using generated type-safe routes
        StatefulShellBranch(
          routes: [
            /// Nested StatefulShellRoute for settings tabs
            StatefulShellRoute.indexedStack(
              builder: (context, state, settingsNavigationShell) {
                return SettingsScreen(navigationShell: settingsNavigationShell);
              },
              branches: [
                /// Account settings branch using generated routes
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      path: const AccountSettingsScreenRouteData().location,
                      builder: (context, state) =>
                          const AccountSettingsScreenRouteData()
                              .build(context, state),
                      routes: [
                        GoRoute(
                          path: 'detail',
                          parentNavigatorKey: rootNavigatorKey,
                          builder: (context, state) =>
                              const SettingsDetailScreenRouteData()
                                  .build(context, state),
                        ),
                        ...getMenuRoutes(rootNavigatorKey),
                      ],
                    ),
                  ],
                ),

                /// Notification settings branch using generated routes
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      path:
                          const NotificationSettingsScreenRouteData().location,
                      builder: (context, state) =>
                          const NotificationSettingsScreenRouteData()
                              .build(context, state),
                      routes: [
                        GoRoute(
                          path: 'detail',
                          parentNavigatorKey: rootNavigatorKey,
                          builder: (context, state) =>
                              const SettingsDetailScreenRouteData()
                                  .build(context, state),
                        ),
                        ...getMenuRoutes(rootNavigatorKey),
                      ],
                    ),
                  ],
                ),

                /// Security settings branch using generated routes
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      path: const SecuritySettingsScreenRouteData().location,
                      builder: (context, state) =>
                          const SecuritySettingsScreenRouteData()
                              .build(context, state),
                      routes: [
                        GoRoute(
                          path: 'detail',
                          parentNavigatorKey: rootNavigatorKey,
                          builder: (context, state) =>
                              const SettingsDetailScreenRouteData()
                                  .build(context, state),
                        ),
                        ...getMenuRoutes(rootNavigatorKey),
                      ],
                    ),
                  ],
                ),

                /// About settings branch using generated routes
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      path: const AboutSettingsScreenRouteData().location,
                      builder: (context, state) =>
                          const AboutSettingsScreenRouteData()
                              .build(context, state),
                      routes: [
                        GoRoute(
                          path: 'detail',
                          parentNavigatorKey: rootNavigatorKey,
                          builder: (context, state) =>
                              const SettingsDetailScreenRouteData()
                                  .build(context, state),
                        ),
                        ...getMenuRoutes(rootNavigatorKey),
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
