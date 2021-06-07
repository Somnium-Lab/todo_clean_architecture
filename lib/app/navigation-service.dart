import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void navigateBack() {
    return navigatorKey.currentState!.pop();
  }

  void navigationPopUntil(String untilRoute) {
    return navigatorKey.currentState!
        .popUntil((ModalRoute.withName(untilRoute)));
  }

  Future navigateTo(String route,
      {bool shouldReplace = false, Object? arguments}) async {
    if (shouldReplace) {
      return navigatorKey.currentState!
          .pushReplacementNamed(route, arguments: arguments);
    }
    return navigatorKey.currentState!.pushNamed(route, arguments: arguments);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      

      default:
        throw Exception("NavigationService: Invalid Navigation");
    }
  }
}
