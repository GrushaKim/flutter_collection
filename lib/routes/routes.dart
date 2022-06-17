import 'package:flutter/material.dart';
import 'package:flutter_collection/screens/home.dart';
import 'package:flutter_collection/screens/main.dart';
import 'package:flutter_collection/screens/splash.dart';
import 'package:flutter_collection/screens/ui.dart';
import 'package:flutter_collection/widgets/ui/roulettes.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.Splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case RouteNames.Home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case RouteNames.Main:
        return MaterialPageRoute(builder: (_) => const MainScreen());

      case RouteNames.UI:
        return MaterialPageRoute(builder: (_) => const UIScreen());

      case RouteNames.Roulettes:
        return MaterialPageRoute(builder: (_) => Roulettes());

      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }

  }

}


abstract class RouteNames {
  static const String Splash = '/splash';
  static const String Main = '/';
  static const String Home = '/home';
  static const String Profile = '/profile';
  static const String UI = '/ui';
  static const String Functions = '/functions';

  static const Roulettes = '/roulettes';
}