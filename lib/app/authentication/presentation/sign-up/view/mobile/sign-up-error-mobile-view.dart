import 'package:flutter/material.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/sign-up/sign-up-controller.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/sign-up/view/widget/sign-up-content-body.dart';

class SignUpErrorMobileView extends StatefulWidget {
  const SignUpErrorMobileView({Key? key, required this.signUpController})
      : super(key: key);

  @override
  _SignUpErrorMobileViewState createState() => _SignUpErrorMobileViewState();

  final SignUpController signUpController;
}

class _SignUpErrorMobileViewState extends State<SignUpErrorMobileView> {
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
          child: Column(
            children: [
              SignUpContentBody(
                emailTextEditingController: emailTextEditingController,
                passwordTextEditingController: passwordTextEditingController,
                controller: widget.signUpController,
              ),
              Text("Error Page")
            ],
          ),
        ),
      ),
    );
  }
}
