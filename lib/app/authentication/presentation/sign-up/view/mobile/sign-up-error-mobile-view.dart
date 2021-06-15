import 'package:flutter/material.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/sign-up/sign-up-controller.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/sign-up/sign-up-state-machine.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/sign-up/view/widget/sign-up-content-body.dart';

class SignUpErrorMobileView extends StatefulWidget {
  const SignUpErrorMobileView({Key? key, required this.signUpController})
      : super(key: key);

  @override
  _SignUpErrorMobileViewState createState() => _SignUpErrorMobileViewState();

  final SignUpController signUpController;
}

class _SignUpErrorMobileViewState extends State<SignUpErrorMobileView> {
  late TextEditingController _emailTextEditingController;
  late TextEditingController _passwordTextEditingController;
  late SignUpErrorState _signUpErrorState;
  @override
  void initState() {
    _signUpErrorState =
        widget.signUpController.getCurrenState() as SignUpErrorState;
    _emailTextEditingController =
        new TextEditingController(text: _signUpErrorState.email);
    _passwordTextEditingController =
        new TextEditingController(text: _signUpErrorState.password);
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
                emailTextEditingController: _emailTextEditingController,
                passwordTextEditingController: _passwordTextEditingController,
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
