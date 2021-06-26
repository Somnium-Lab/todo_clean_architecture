import 'package:todo_clean_architecture/core/presentation/state-machine.dart';

class UpdateTodoStateMachine
    extends StateMachine<UpdateTodoState, UpdateTodoEvent> {
  UpdateTodoStateMachine() : super(UpdateTodoInitState());

  @override
  UpdateTodoState getStateOnEvent(UpdateTodoEvent event) {
    final eventType = event.runtimeType;

    UpdateTodoState newState = getCurrentState();

    switch (eventType) {
      case UpdateTodoErrorEvent:
        newState = new UpdateTodoErrorState();
        break;

      case UpdateTodoClickEvent:
        newState = new UpdateTodoLoadingState();
        break;
    }

    return newState;
  }
}

class UpdateTodoInitState extends UpdateTodoState {}

class UpdateTodoState {}

class UpdateTodoEvent {}

class UpdateTodoLoadingState extends UpdateTodoState {}

class UpdateTodoClickEvent extends UpdateTodoEvent {}

class UpdateTodoErrorState extends UpdateTodoState {}

class UpdateTodoErrorEvent extends UpdateTodoEvent {}
