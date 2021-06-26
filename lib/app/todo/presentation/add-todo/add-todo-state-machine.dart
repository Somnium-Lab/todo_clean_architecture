import 'package:todo_clean_architecture/core/presentation/state-machine.dart';

class AddTodoStateMachine extends StateMachine<AddTodoState, AddTodoEvent> {
  AddTodoStateMachine() : super(AddTodoInitState());

  @override
  AddTodoState getStateOnEvent(AddTodoEvent event) {
    final eventType = event.runtimeType;
    AddTodoState newState = getCurrentState();
    switch (eventType) {
      case AddTodoClickEvent:
        newState = new AddTodoLoadingState();
        break;

      case AddTodoErrorEvent:
        newState = new AddTodoErrorState();
        break;
    }
    return newState;
  }
}

class AddTodoInitState extends AddTodoState {}

class AddTodoErrorState extends AddTodoState {}

class AddTodoLoadingState extends AddTodoState {}

class AddTodoState {}

class AddTodoClickEvent extends AddTodoEvent {}

class AddTodoErrorEvent extends AddTodoEvent {}

class AddTodoEvent {}
