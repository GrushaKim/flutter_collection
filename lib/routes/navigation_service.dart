import 'package:flutter/cupertino.dart';

class NavigationService {
  final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  
  BuildContext getContext() {
    return navigatorKey.currentState!.overlay!.context;
  }

  bool canPop() {
    if (navigatorKey.currentState == null) return false;
    return navigatorKey.currentState!.canPop();
  }

  dynamic pop() {
    if (navigatorKey.currentState == null) {
      return null;
    }

    return navigatorKey.currentState!.pop();
  }

  dynamic popUpPop({bool value = false}) {
    if (navigatorKey.currentState == null) {
      return null;
    }

    return navigatorKey.currentState!.pop(value);
  }

  dynamic navigate(String routeName, {Object? arguments}) {
    if (navigatorKey.currentState == null) {
      return null;
    }

    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  dynamic replace(String routeName) {
    if (navigatorKey.currentState == null) {
      return null;
    }

    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  // Navigate to route and clear all other widgets in tree
  dynamic navigateAndClear(String routeName, {Object? arguments}) {
    if (navigatorKey.currentState == null) {
      return null;
    }

    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (_) => false,
      arguments: arguments,
    );
  }
}