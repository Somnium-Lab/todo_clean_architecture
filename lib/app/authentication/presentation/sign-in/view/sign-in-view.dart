import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/sign-in/sign-in-controller.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/sign-in/sign-in-state-machine.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/sign-in/view/mobile/sign-in-error-mobile-view.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/sign-in/view/mobile/sign-in-init-mobile-view.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/sign-in/view/mobile/sign-in-loading-mobile-view.dart';

class SignInView extends View {
  @override
  State<StatefulWidget> createState() => SignInViewState();
}

class SignInViewState
    extends ResponsiveViewState<SignInView, SignInController> {
  SignInViewState() : super(new SignInController());

  @override
  Widget get desktopView => throw UnimplementedError();

  @override
  Widget get mobileView {
    return ControlledWidgetBuilder<SignInController>(
      builder: (context, controller) {
        final currentStateType = controller.getCurrentState().runtimeType;
        print("Mobile View Called with state $currentStateType");

        switch (currentStateType) {
          case SignInInitState:
            return SignInInitMobileView();

          case SignInLoadingState:
            return SignInLoadingMobileView();

          case SignInErrorState:
            return SignInErrorMobileView();

          default:
            throw Exception("Unknown state $currentStateType : SignInView");
        }
      },
    );
  }

  @override
  Widget get tabletView => throw UnimplementedError();

  @override
  Widget get watchView => throw UnimplementedError();
}
