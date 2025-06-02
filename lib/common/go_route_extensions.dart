import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension GoRouteExtensions on GoRoute {
  /// Creates a copy of this [GoRoute] with an updated [parentNavigatorKey].
  /// All other properties remain the same.
  GoRoute copyWith({GlobalKey<NavigatorState>? parentNavigatorKey}) {
    return GoRoute(
      path: path,
      name: name,
      builder: builder,
      pageBuilder: pageBuilder,
      parentNavigatorKey: parentNavigatorKey ?? this.parentNavigatorKey,
      redirect: redirect,
      onExit: onExit,
      routes: routes,
    );
  }

}
