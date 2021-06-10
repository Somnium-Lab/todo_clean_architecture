import 'package:flutter/material.dart';

class SignInLoadingMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Container(
        child: Center(
          child: CircularProgressIndicator(
            
          ),
        ),
      )
    );
  }
}
