import 'package:flutter/material.dart';
import 'package:task/presentation/login/login_view.dart';
import 'package:task/presentation/resources/string_manager.dart';

import '../main/view/main_view.dart';

abstract class RouteManager {
  static const String login = "/login";
  static const String home = "/home";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteManager.login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case RouteManager.home:
        return MaterialPageRoute(builder: (_) => const MainView());
      default:
        return _default();
    }
  }

  static Route<dynamic> _default() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(StringManager.noRouteFound),
              ),
              body: const Center(child: Text(StringManager.noRouteFound)),
            ));
  }
}
