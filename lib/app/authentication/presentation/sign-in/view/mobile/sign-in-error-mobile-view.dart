import 'package:flutter/material.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/sign-in/sign-in-controller.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/sign-in/sign-in-state-machine.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/sign-in/view/widget/sign-in-content-body.dart';

class SignInErrorMobileView extends StatefulWidget {
  final SignInController signInController;

  const SignInErrorMobileView({Key? key, required this.signInController})
      : super(key: key);

  @override
  _SignInErrorMobileViewState createState() => _SignInErrorMobileViewState();
}

class _SignInErrorMobileViewState extends State<SignInErrorMobileView> {
  late SignInErrorState signInErrorState;
  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;

  @override
  void initState() {
    signInErrorState =
        widget.signInController.getCurrentState() as SignInErrorState;
    emailTextController =
        new TextEditingController(text: signInErrorState.email);
    passwordTextController =
        new TextEditingController(text: signInErrorState.password);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(title: Text("TODO APPLICATION")),
        body: Container(
          child: Column(
            children: [
              SignInContentBody(
                emailTextController: emailTextController,
                passwordTextController: passwordTextController,
                signInController: widget.signInController,
              ),
              Text("ERROR")
            ],
          ),
        ),
      ),
    );
  }
}
