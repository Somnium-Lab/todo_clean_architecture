import 'package:flutter/material.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/sign-in/sign-in-controller.dart';

class SignInContentBody extends StatelessWidget {
  const SignInContentBody(
      {Key? key,
      required this.emailTextController,
      required this.passwordTextController,
      required this.signInController})
      : super(key: key);

  final TextEditingController emailTextController;
  final TextEditingController passwordTextController;
  final SignInController signInController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Welcome to "),
        SizedBox(
          height: 10,
        ),
        Text("TODO APP "),
        SizedBox(
          height: 30,
        ),
        TextFormField(
          controller: emailTextController,
          decoration: const InputDecoration(
            icon: Icon(Icons.email_sharp),
            hintText: "abc@gmail.com",
            labelText: "Email Id",
          ),
        ),
        SizedBox(height: 20),
        TextFormField(
          controller: passwordTextController,
          decoration: const InputDecoration(
            icon: Icon(Icons.password_outlined),
            labelText: "Password",
          ),
        ),
        SizedBox(
          height: 30,
        ),
        TextButton(
          onPressed: () {
            if (emailTextController.text.isNotEmpty ||
                passwordTextController.text.isNotEmpty) {
              signInController.userSignIn(
                email: emailTextController.text,
                password: passwordTextController.text,
              );
            }
          },
          child: Text("SIGN IN"),
        ),
        TextButton(
          onPressed: () {
            signInController.navigateToSignUp();
          },
          child: Text("Go to Sign Up"),
        ),
      ],
    );
  }
}
