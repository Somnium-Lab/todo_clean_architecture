import 'package:flutter/material.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/sign-up/sign-up-controller.dart';

class SignUpContentBody extends StatelessWidget {
  const SignUpContentBody({
    Key? key,
    required this.emailTextEditingController,
    required this.passwordTextEditingController,
    required this.controller,
  }) : super(key: key);

  final TextEditingController emailTextEditingController;
  final TextEditingController passwordTextEditingController;
  final SignUpController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
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
            controller: emailTextEditingController,
            decoration: const InputDecoration(
              icon: Icon(Icons.email_sharp),
              hintText: "abc@gmail.com",
              labelText: "Email Id",
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: passwordTextEditingController,
            decoration: const InputDecoration(
              icon: Icon(Icons.email_sharp),
              labelText: "Password",
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () {
              if (emailTextEditingController.text.isNotEmpty ||
                  passwordTextEditingController.text.isNotEmpty) {
                controller.userSignUp(
                  email: emailTextEditingController.text,
                  password: passwordTextEditingController.text,
                );
              } else {}
            },
            child: Text("SIGN UP"),
          )
        ],
      ),
    );
  }
}
