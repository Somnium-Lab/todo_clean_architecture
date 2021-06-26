import 'package:flutter/material.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/sign-in/view/sign-in-view.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/sign-up/view/sign-up-view.dart';
import 'package:todo_clean_architecture/app/todo/presentation/add-todo/view/add-todo-view.dart';
import 'package:todo_clean_architecture/app/todo/presentation/get-todo/view/get-todo-view.dart';
import 'package:todo_clean_architecture/app/todo/presentation/update-todo/view/update-todo-view.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static const String homePageRoute = "/home-page";
  static const String signInPageRoute = "/sign-in-page";
  static const String signUpPageRoute = "/sign-up-page";
  static const String updateTodoPageRoute = "/update-todo-page";
  static const String getTodoPageRoute = "/get-todo-page";
  static const String addTodoPageRoute = "/add-todo-page";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePageRoute:
        return MaterialPageRoute(
          builder: (_) => GetTodoView(),
          settings: RouteSettings(
            name: NavigationService.homePageRoute,
          ),
        );

      case signInPageRoute:
        return MaterialPageRoute(
          builder: (_) => SignInView(),
          settings: RouteSettings(
            name: NavigationService.signInPageRoute,
          ),
        );

      case signUpPageRoute:
        return MaterialPageRoute(
          builder: (_) => SignUpView(),
          settings: RouteSettings(
            name: NavigationService.signUpPageRoute,
          ),
        );

      case updateTodoPageRoute:
        return MaterialPageRoute(
          builder: (_) => UpdateTodoView(
            settings.arguments! as UpdateTodoViewParams,
          ),
          settings: RouteSettings(
            name: NavigationService.updateTodoPageRoute,
          ),
        );

      case addTodoPageRoute:
        return MaterialPageRoute(
          builder: (_) => AddTodoView(),
          settings: RouteSettings(name: NavigationService.addTodoPageRoute),
        );

      default:
        throw Exception("NavigationService: Invalid Navigation");
    }
  }

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
}
