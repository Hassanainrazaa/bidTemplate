// route_generator.dart
import 'package:flutter/material.dart';
import 'package:my_flutter_web_project/features/login/login_view.dart';
import 'package:my_flutter_web_project/features/main_page/main_view.dart';
import 'package:my_flutter_web_project/routes/routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.home:
        // Add more cases for home routes
        return MaterialPageRoute(builder: (_) =>  const HomePage());

      // Add more cases for additional routes
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Page not found'),
        ),
      );
    });
  }
}
