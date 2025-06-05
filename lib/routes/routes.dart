import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_poc_khalid/home/home_screen.dart';
import 'package:go_router_poc_khalid/home/profile_screen.dart';
import 'package:go_router_poc_khalid/home/splash_screen.dart';
import 'package:go_router_poc_khalid/home/widgets/about_settings_screen.dart';
import 'package:go_router_poc_khalid/home/widgets/account_settings_screen.dart';
import 'package:go_router_poc_khalid/home/widgets/notification_settings_screen.dart';
import 'package:go_router_poc_khalid/home/widgets/security_settings_screen.dart';
import 'package:go_router_poc_khalid/home/widgets/settings_detail_screen.dart';

part 'routes.g.dart';

/// Splash route - entry point of the app
@TypedGoRoute<SplashScreenRouteData>(path: '/')
@immutable
class SplashScreenRouteData extends GoRouteData {
  const SplashScreenRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashScreen();
  }
}

/// Home route - main navigation tab
@TypedGoRoute<HomeScreenRouteData>(path: '/home')
@immutable
class HomeScreenRouteData extends GoRouteData {
  const HomeScreenRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}

/// Profile route - main navigation tab
@TypedGoRoute<ProfileScreenRouteData>(path: '/profile')
@immutable
class ProfileScreenRouteData extends GoRouteData {
  const ProfileScreenRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ProfileScreen();
  }
}

/// Settings Account route
@TypedGoRoute<AccountSettingsScreenRouteData>(
  path: '/settings/account',
  routes: [
    TypedGoRoute<SettingsDetailScreenRouteData>(path: '/detail'),
  ],
)
@immutable
class AccountSettingsScreenRouteData extends GoRouteData {
  const AccountSettingsScreenRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AccountSettingsScreen();
  }
}

/// Settings Notifications route
@TypedGoRoute<NotificationSettingsScreenRouteData>(
  path: '/settings/notifications',
  routes: [
    TypedGoRoute<SettingsDetailScreenRouteData>(path: '/detail'),
  ],
)
@immutable
class NotificationSettingsScreenRouteData extends GoRouteData {
  const NotificationSettingsScreenRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const NotificationSettingsScreen();
  }
}

/// Settings Security route
@TypedGoRoute<SecuritySettingsScreenRouteData>(
  path: '/settings/security',
  routes: [
    TypedGoRoute<SettingsDetailScreenRouteData>(path: '/detail'),
  ],
)
@immutable
class SecuritySettingsScreenRouteData extends GoRouteData {
  const SecuritySettingsScreenRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SecuritySettingsScreen();
  }
}

/// Settings About route
@TypedGoRoute<AboutSettingsScreenRouteData>(
  path: '/settings/about',
  routes: [
    TypedGoRoute<SettingsDetailScreenRouteData>(path: '/detail'),
  ],
)
@immutable
class AboutSettingsScreenRouteData extends GoRouteData {
  const AboutSettingsScreenRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AboutSettingsScreen();
  }
}

/// Settings detail route
@immutable
class SettingsDetailScreenRouteData extends GoRouteData {
  const SettingsDetailScreenRouteData({this.title});

  final String? title;

  String _getSettingTypeFromPath(String path) {
    if (path.contains('/account/')) return 'account';
    if (path.contains('/notifications/')) return 'notifications';
    if (path.contains('/security/')) return 'security';
    if (path.contains('/about/')) return 'about';
    return 'setting';
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SettingsDetailScreen(
      title: title ?? 'Setting',
      settingType: _getSettingTypeFromPath(state.fullPath ?? ''),
    );
  }
}
