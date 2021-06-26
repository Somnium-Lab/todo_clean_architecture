import 'package:todo_clean_architecture/app/todo/domain/entity/todo-entity.dart';
import 'package:todo_clean_architecture/core/presentation/state-machine.dart';

class GetTodoStateMachine extends StateMachine<GetTodoState, GetTodoEvent> {
  GetTodoStateMachine() : super(GetTodoInitializationState());

  @override
  GetTodoState getStateOnEvent(GetTodoEvent event) {
    final eventType = event.runtimeType;
    GetTodoState newState = getCurrentState();

    switch (eventType) {
      case GetTodoInitializedEvent:
        GetTodoInitializedEvent getTodoInitializedEvent =
            event as GetTodoInitializedEvent;
        newState = new GetTodoInitializedState(
            todoList: getTodoInitializedEvent.todoList);
        break;
       
      case GetTodoErrorEvent:
        newState = new GetTodoErrorState();
        break;
    }

    return newState;
  }
}

class GetTodoInitializationState extends GetTodoState {}

class GetTodoInitializedState extends GetTodoState {
  final List<TodoEntity> todoList;

  GetTodoInitializedState({required this.todoList});
}

class GetTodoInitializedEvent extends GetTodoEvent {
  final List<TodoEntity> todoList;

  GetTodoInitializedEvent({required this.todoList});
}

class GetTodoState {}

class GetTodoEvent {}

class GetTodoErrorEvent extends GetTodoEvent {}

class GetTodoErrorState extends GetTodoState {}
