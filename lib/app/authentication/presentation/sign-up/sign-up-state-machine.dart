import 'package:todo_clean_architecture/core/presentation/state-machine.dart';

class SignUpStateMachine extends StateMachine<SignUpState, SignUpEvent> {
  SignUpStateMachine() : super(SignUpInitState());

  @override
  SignUpState getStateOnEvent(SignUpEvent event) {
    final eventType = event.runtimeType;
    SignUpState newState = getCurrentState();

    switch (eventType) {
      case SignUpClickEvent:
        newState = new SignUpLoadingState();
        break;
      case SignUpErrorEvent:
        newState = new SignUpErrorState();
        break;

      default:
        throw Exception("Invalid State : SignUpStateMachine");
    }

    return newState;
  }
}

class SignUpState {}

class SignUpInitState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpErrorState extends SignUpState {}

class SignUpEvent {}

class SignUpClickEvent extends SignUpEvent {}

class SignUpErrorEvent extends SignUpEvent {}
