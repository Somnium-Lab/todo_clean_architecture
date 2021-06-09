import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/sign-in/sign-in-controller.dart';

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
  Widget get mobileView => throw UnimplementedError();

  @override
  Widget get tabletView => throw UnimplementedError();

  @override
  Widget get watchView => throw UnimplementedError();
}
