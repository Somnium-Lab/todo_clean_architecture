import 'package:flutter/material.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/sign-up/sign-up-controller.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/sign-up/view/widget/sign-up-content-body.dart';

class SignUpInitMobileView extends StatefulWidget {
  final SignUpController signUpController;

  const SignUpInitMobileView({Key? key, required this.signUpController})
      : super(key: key);

  @override
  _SignUpInitMobileViewState createState() => _SignUpInitMobileViewState();
}

class _SignUpInitMobileViewState extends State<SignUpInitMobileView> {
  late TextEditingController emailTextEditingController;
  late TextEditingController passwordTextEditingController;

  @override
  void initState() {
    emailTextEditingController = new TextEditingController();
    passwordTextEditingController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(title: Text("TODO APPLICATION")),
        body: Container(
          child: SignUpContentBody(
            emailTextEditingController: emailTextEditingController,
            passwordTextEditingController: passwordTextEditingController,
            controller: widget.signUpController,
          ),
        ),
      ),
    );
  }
}
