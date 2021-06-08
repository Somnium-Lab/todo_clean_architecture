import 'package:todo_clean_architecture/core/presentation/state-machine.dart';

class SignInStateMachine extends StateMachine<SignInState, SignInEvent> {
  SignInStateMachine() : super(SignInInitializationState());

  @override
  SignInState getStateOnEvent(SignInEvent event) {
    final eventType = event.runtimeType;
    SignInState newState = getCurrentState();
    switch (eventType) {
    }
    return newState;
  }
}

class SignInInitializationState extends SignInState {}

class SignInState {}

class SignInEvent {}
