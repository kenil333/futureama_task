import 'package:flutter/material.dart';

class AppMethod {
  static void pushRoute(
    BuildContext context,
    Widget screen, {
    String? routeName,
  }) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          settings: routeName != null ? RouteSettings(name: routeName) : null,
          builder: (_) => screen,
        ),
      );

  static void pushReplacementRoute(
    BuildContext context,
    Widget screen, {
    String? routeName,
  }) =>
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          settings: routeName != null ? RouteSettings(name: routeName) : null,
          builder: (_) => screen,
        ),
      );
}
