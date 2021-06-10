import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/splash-screen/splash-screen-controller.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/splash-screen/splash-screen-state-machine.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/splash-screen/view/widget/splash-screen-widget.dart';

class SplashScreenView extends View {
  @override
  State<StatefulWidget> createState() => SplashScreenViewState();
}

class SplashScreenViewState
    extends ResponsiveViewState<SplashScreenView, SplashScreenController> {
  SplashScreenViewState() : super(new SplashScreenController());

  @override
  Widget get desktopView => throw UnimplementedError();

  @override
  Widget get mobileView {
    return ControlledWidgetBuilder<SplashScreenController>(
        builder: (context, controller) {
      final currentStateType = controller.getCurrentState().runtimeType;
      final SplashScreenState state = controller.getCurrentState();

      switch (currentStateType) {
        case SplashScreenInitializationState:
          return SplashScreenWidget(
            splashScreenController: controller,
          );

        default:
          throw Exception("Invalid State $state : splash screen view");
      }
    });
  }

  @override
  Widget get tabletView => throw UnimplementedError();

  @override
  Widget get watchView => throw UnimplementedError();
}
