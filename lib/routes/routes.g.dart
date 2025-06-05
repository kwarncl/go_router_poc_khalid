// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $splashScreenRouteData,
      $homeScreenRouteData,
      $profileScreenRouteData,
      $accountSettingsScreenRouteData,
      $notificationSettingsScreenRouteData,
      $securitySettingsScreenRouteData,
      $aboutSettingsScreenRouteData,
    ];

RouteBase get $splashScreenRouteData => GoRouteData.$route(
      path: '/',
      factory: $SplashScreenRouteDataExtension._fromState,
    );

extension $SplashScreenRouteDataExtension on SplashScreenRouteData {
  static SplashScreenRouteData _fromState(GoRouterState state) =>
      const SplashScreenRouteData();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $homeScreenRouteData => GoRouteData.$route(
      path: '/home',
      factory: $HomeScreenRouteDataExtension._fromState,
    );

extension $HomeScreenRouteDataExtension on HomeScreenRouteData {
  static HomeScreenRouteData _fromState(GoRouterState state) =>
      const HomeScreenRouteData();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $profileScreenRouteData => GoRouteData.$route(
      path: '/profile',
      factory: $ProfileScreenRouteDataExtension._fromState,
    );

extension $ProfileScreenRouteDataExtension on ProfileScreenRouteData {
  static ProfileScreenRouteData _fromState(GoRouterState state) =>
      const ProfileScreenRouteData();

  String get location => GoRouteData.$location(
        '/profile',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $accountSettingsScreenRouteData => GoRouteData.$route(
      path: '/settings/account',
      factory: $AccountSettingsScreenRouteDataExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/detail',
          factory: $SettingsDetailScreenRouteDataExtension._fromState,
        ),
      ],
    );

extension $AccountSettingsScreenRouteDataExtension
    on AccountSettingsScreenRouteData {
  static AccountSettingsScreenRouteData _fromState(GoRouterState state) =>
      const AccountSettingsScreenRouteData();

  String get location => GoRouteData.$location(
        '/settings/account',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SettingsDetailScreenRouteDataExtension
    on SettingsDetailScreenRouteData {
  static SettingsDetailScreenRouteData _fromState(GoRouterState state) =>
      SettingsDetailScreenRouteData(
        title: state.uri.queryParameters['title'],
      );

  String get location => GoRouteData.$location(
        '/detail',
        queryParams: {
          if (title != null) 'title': title,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $notificationSettingsScreenRouteData => GoRouteData.$route(
      path: '/settings/notifications',
      factory: $NotificationSettingsScreenRouteDataExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/detail',
          factory: $SettingsDetailScreenRouteDataExtension._fromState,
        ),
      ],
    );

extension $NotificationSettingsScreenRouteDataExtension
    on NotificationSettingsScreenRouteData {
  static NotificationSettingsScreenRouteData _fromState(GoRouterState state) =>
      const NotificationSettingsScreenRouteData();

  String get location => GoRouteData.$location(
        '/settings/notifications',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $securitySettingsScreenRouteData => GoRouteData.$route(
      path: '/settings/security',
      factory: $SecuritySettingsScreenRouteDataExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/detail',
          factory: $SettingsDetailScreenRouteDataExtension._fromState,
        ),
      ],
    );

extension $SecuritySettingsScreenRouteDataExtension
    on SecuritySettingsScreenRouteData {
  static SecuritySettingsScreenRouteData _fromState(GoRouterState state) =>
      const SecuritySettingsScreenRouteData();

  String get location => GoRouteData.$location(
        '/settings/security',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $aboutSettingsScreenRouteData => GoRouteData.$route(
      path: '/settings/about',
      factory: $AboutSettingsScreenRouteDataExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/detail',
          factory: $SettingsDetailScreenRouteDataExtension._fromState,
        ),
      ],
    );

extension $AboutSettingsScreenRouteDataExtension
    on AboutSettingsScreenRouteData {
  static AboutSettingsScreenRouteData _fromState(GoRouterState state) =>
      const AboutSettingsScreenRouteData();

  String get location => GoRouteData.$location(
        '/settings/about',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
