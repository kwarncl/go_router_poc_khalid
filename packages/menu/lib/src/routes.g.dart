// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $menuListScreenRouteData,
      $menuDetailScreenDirectRouteData,
    ];

RouteBase get $menuListScreenRouteData => GoRouteData.$route(
      path: 'menu',
      factory: $MenuListScreenRouteDataExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'details/:id',
          factory: $MenuDetailScreenFromListRouteDataExtension._fromState,
        ),
      ],
    );

extension $MenuListScreenRouteDataExtension on MenuListScreenRouteData {
  static MenuListScreenRouteData _fromState(GoRouterState state) =>
      const MenuListScreenRouteData();

  String get location => GoRouteData.$location(
        'menu',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MenuDetailScreenFromListRouteDataExtension
    on MenuDetailScreenFromListRouteData {
  static MenuDetailScreenFromListRouteData _fromState(GoRouterState state) =>
      MenuDetailScreenFromListRouteData(
        id: state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        'menu/details/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $menuDetailScreenDirectRouteData => GoRouteData.$route(
      path: 'menudetails/:id',
      factory: $MenuDetailScreenDirectRouteDataExtension._fromState,
    );

extension $MenuDetailScreenDirectRouteDataExtension
    on MenuDetailScreenDirectRouteData {
  static MenuDetailScreenDirectRouteData _fromState(GoRouterState state) =>
      MenuDetailScreenDirectRouteData(
        id: state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        'menudetails/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
