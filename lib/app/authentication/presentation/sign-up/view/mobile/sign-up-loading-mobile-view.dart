import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/sign-up/sign-up-controller.dart';

class SignUpLoadingMobileView extends StatelessWidget {
  final SignUpController signUpController;

  const SignUpLoadingMobileView({Key? key, required this.signUpController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}
