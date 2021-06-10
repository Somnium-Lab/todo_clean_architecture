import 'package:flutter/material.dart';

class SignUpInitMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(title: Text("TODO APPLICATION")),
        body: Container(
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
                decoration: const InputDecoration(
                  icon: Icon(Icons.email_sharp),
                  hintText: "abc@gmail.com",
                  labelText: "Email Id",
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.email_sharp),
                  labelText: "Password",
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextButton(onPressed: () {}, child: Text("SIGN UP"))
            ],
          ),
        ),
      ),
    );
  }
}
