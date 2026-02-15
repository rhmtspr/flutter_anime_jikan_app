import 'package:flutter/material.dart';
import 'package:shimmer/main.dart';
import '../../features/anime/presentation/pages/home_page.dart';

class AppRouter {
  static const home = '/';

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
