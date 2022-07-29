import 'package:flutter/material.dart';
import 'package:flutter_collection/screens/func/my_qr.dart';
import 'package:flutter_collection/screens/func/qr_scanner.dart';
import 'package:flutter_collection/screens/func/riverpod.dart';
import 'package:flutter_collection/screens/home.dart';
import 'package:flutter_collection/screens/main.dart';
import 'package:flutter_collection/screens/splash.dart';
import 'package:flutter_collection/screens/ui.dart';
import 'package:flutter_collection/screens/ui/animated_splash.dart';
import 'package:flutter_collection/widgets/func/dday_counter.dart';
import 'package:flutter_collection/screens/func/dropdown_filter.dart';
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

      // UI

      case RouteNames.Roulettes:
        return MaterialPageRoute(builder: (_) => Roulettes());
      
      case RouteNames.AnimatedSplash:
        return MaterialPageRoute(builder: (_) => AnimatedSplashScreen());

      // FUNCS

      case RouteNames.QrScanner:
        return MaterialPageRoute(builder: (_) => QrScannerScreen());

      case RouteNames.MyQr:
        return MaterialPageRoute(builder: (_) => MyQrScreen());
   
      case RouteNames.Riverpod:
        return MaterialPageRoute(builder: (_) => RiverpodScreen());
    
      case RouteNames.Dday:
        return MaterialPageRoute(builder: (_) => DdayCounter());
      
      case RouteNames.Dropdown:
        return MaterialPageRoute(builder: (_) => DropdownFilterScreen());

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

  // UI components
  static const String Roulettes = '/roulettes';
  static const String AnimatedSplash = '/animatedSplash';


  // Function components 
  static const String QrScanner = '/qrScanner';
  static const String MyQr = '/myQr';
  static const String Riverpod = '/riverpod';
  static const String Dday = '/dday';
  static const String Dropdown = '/dropdownFilter';
}