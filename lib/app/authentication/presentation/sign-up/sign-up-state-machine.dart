import 'package:todo_clean_architecture/core/presentation/state-machine.dart';

class SignUpStateMachine extends StateMachine<SignUpState, SignUpEvent> {
  SignUpStateMachine() : super(SignUpInitializationState());

  @override
  SignUpState getStateOnEvent(SignUpEvent event) {
    final eventType = event.runtimeType;
    SignUpState newState = getCurrentState();

    switch (eventType) {
    }

    return newState;
  }
}

class SignUpInitializationState extends SignUpState {}

class SignUpState {}

class SignUpEvent {}
