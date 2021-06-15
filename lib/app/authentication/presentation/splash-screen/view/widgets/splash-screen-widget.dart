import 'package:flutter/material.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/splash-screen/splash-screen-controller.dart';

class SplashScreenWidget extends StatelessWidget {
  final SplashScreenController splashScreenController;

  const SplashScreenWidget({Key? key, required this.splashScreenController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    splashScreenController.checkUserIsSign();
    return Scaffold(
      body: Center(
        child: Icon(Icons.ac_unit),
      ),
    );
  }
}
