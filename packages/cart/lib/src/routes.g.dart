// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $cartListScreenRouteData,
      $cartDetailScreenDirectRouteData,
    ];

RouteBase get $cartListScreenRouteData => GoRouteData.$route(
      path: 'cart',
      factory: $CartListScreenRouteDataExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'details/:id',
          factory: $CartDetailScreenFromListRouteDataExtension._fromState,
        ),
      ],
    );

extension $CartListScreenRouteDataExtension on CartListScreenRouteData {
  static CartListScreenRouteData _fromState(GoRouterState state) =>
      const CartListScreenRouteData();

  String get location => GoRouteData.$location(
        'cart',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CartDetailScreenFromListRouteDataExtension
    on CartDetailScreenFromListRouteData {
  static CartDetailScreenFromListRouteData _fromState(GoRouterState state) =>
      CartDetailScreenFromListRouteData(
        id: state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        'cart/details/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $cartDetailScreenDirectRouteData => GoRouteData.$route(
      path: 'details/:id',
      factory: $CartDetailScreenDirectRouteDataExtension._fromState,
    );

extension $CartDetailScreenDirectRouteDataExtension
    on CartDetailScreenDirectRouteData {
  static CartDetailScreenDirectRouteData _fromState(GoRouterState state) =>
      CartDetailScreenDirectRouteData(
        id: state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        'details/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
