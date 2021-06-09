import 'package:todo_clean_architecture/core/presentation/state-machine.dart';

class SignInStateMachine extends StateMachine<SignInState, SignInEvent> {
  SignInStateMachine() : super(SignInInitState());

  @override
  SignInState getStateOnEvent(SignInEvent event) {
    final eventType = event.runtimeType;
    SignInState newState = getCurrentState();
    switch (eventType) {
      case SignInClickEvent:
        newState = new SignInLoadingState();
        break;

      case SignInErrorEvent:
        newState = SignInErrorState();
        break;

      default:
        throw Exception("Invalid State : SignInStateMachine");
    }
    return newState;
  }
}

class SignInState {}

class SignInErrorState extends SignInState {}

class SignInInitState extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInEvent {}

class SignInErrorEvent extends SignInEvent {}

class SignInClickEvent extends SignInEvent {}
