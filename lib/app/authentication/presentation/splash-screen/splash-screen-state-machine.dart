import 'package:todo_clean_architecture/core/presentation/state-machine.dart';

class SplashScreenStateMachine
    extends StateMachine<SplashScreenState, SplashScreenEvent> {
  SplashScreenStateMachine() : super(SplashScreenInitializationState());

  @override
  getStateOnEvent(SplashScreenEvent event) {
    final eventType = event.runtimeType;
    SplashScreenState newState = getCurrentState();
    switch (eventType) {
    }

    return newState;
  }
}

class SplashScreenInitializationState extends SplashScreenState {}

class SplashScreenState {}

class SplashScreenEvent {}
