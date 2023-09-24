import 'package:flutter/material.dart';
import 'package:form/screen/home_screen/home_screen.dart';

class Routes {
  Routes._();
  static const String homeScreen = '/home_screen';
}

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return null;
    }
  }
}
