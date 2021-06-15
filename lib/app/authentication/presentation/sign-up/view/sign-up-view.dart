import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/sign-up/sign-up-controller.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/sign-up/sign-up-state-machine.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/sign-up/view/mobile/sign-up-error-mobile-view.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/sign-up/view/mobile/sign-up-init-mobile-view.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/sign-up/view/mobile/sign-up-loading-mobile-view.dart';

class SignUpView extends View {
  @override
  State<StatefulWidget> createState() => SignUpViewState();
}

class SignUpViewState
    extends ResponsiveViewState<SignUpView, SignUpController> {
  SignUpViewState() : super(new SignUpController());

  @override
  Widget get desktopView => throw UnimplementedError();

  @override
  Widget get mobileView {
    return ControlledWidgetBuilder<SignUpController>(
      builder: (context, controller) {
        final currentStateType = controller.getCurrenState().runtimeType;
        print("Mobile View called with state $currentStateType");

        switch (currentStateType) {
          case SignUpInitState:
            return SignUpInitMobileView(
              signUpController: controller,
            );

          case SignUpLoadingState:
            return SignUpLoadingMobileView(
              signUpController: controller,
            );

          case SignUpErrorState:
            return SignUpErrorMobileView(
              signUpController: controller,
            );

          default:
            throw Exception("Unknown state $currentStateType : SignupView");
        }
      },
    );
  }

  @override
  Widget get tabletView => throw UnimplementedError();

  @override
  Widget get watchView => throw UnimplementedError();
}
