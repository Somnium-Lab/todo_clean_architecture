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
        SignInErrorEvent signInErrorEvent = event as SignInErrorEvent;
        newState = new SignInErrorState(
          email: signInErrorEvent.email,
          password: signInErrorEvent.password,
        );
        break;

      default:
        throw Exception("Invalid State : SignInStateMachine");
    }
    return newState;
  }
}

class SignInState {}

class SignInErrorState extends SignInState {
  final String email;
  final String password;

  SignInErrorState({required this.email, required this.password});
}

class SignInInitState extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInEvent {}

class SignInErrorEvent extends SignInEvent {
  final String email;
  final String password;

  SignInErrorEvent({
    required this.email,
    required this.password,
  });
}

class SignInClickEvent extends SignInEvent {}
