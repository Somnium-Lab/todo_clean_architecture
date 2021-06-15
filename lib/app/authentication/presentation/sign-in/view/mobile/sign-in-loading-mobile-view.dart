import 'package:flutter/material.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/sign-in/sign-in-controller.dart';

class SignInLoadingMobileView extends StatelessWidget {
  final SignInController signInController;

  const SignInLoadingMobileView({Key? key, required this.signInController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    ));
  }
}
