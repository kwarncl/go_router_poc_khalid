import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Util {
  const Util._();

  static void returnToOriginatingTab(BuildContext context) {
    final targetRoute = switch (GoRouterState.of(context).fullPath) {
      String path when path.contains('/home/') => '/home',
      String path when path.contains('/profile/') => '/profile',
      _ => './..'
    };
    context.go(targetRoute);
  }
}
