import 'package:flutter/material.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/sign-in/sign-in-controller.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/sign-in/view/widget/sign-in-content-body.dart';

class SignInInitMobileView extends StatefulWidget {
  final SignInController signInController;

  const SignInInitMobileView({Key? key, required this.signInController})
      : super(key: key);

  SignInInitMobileViewState createState() => SignInInitMobileViewState();
}

class SignInInitMobileViewState extends State<SignInInitMobileView> {
  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;

  @override
  void initState() {
    emailTextController = new TextEditingController();
    passwordTextController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(title: Text("TODO APPLICATION")),
        body: Container(
          child: SignInContentBody(
            emailTextController: emailTextController,
            passwordTextController: passwordTextController,
            signInController: widget.signInController,
          ),
        ),
      ),
    );
  }
}
