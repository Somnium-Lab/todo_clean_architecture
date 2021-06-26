import 'package:flutter/material.dart';
import 'package:todo_clean_architecture/app/todo/presentation/get-todo/get-todo-controller.dart';
import 'package:todo_clean_architecture/app/todo/presentation/get-todo/get-todo-state-machine.dart';

class GetTodoBodyContentMobileView extends StatelessWidget {
  final GetTodoController getTodoController;

  final GetTodoInitializedState getTodoInitializedState;

  const GetTodoBodyContentMobileView({
    Key? key,
    required this.getTodoController,
    required this.getTodoInitializedState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            for (var i = 0; i < getTodoInitializedState.todoList.length; i++)
              GestureDetector(
                onLongPress: () {
                  getTodoController.navigateToUpdatePage(
                      task: getTodoInitializedState.todoList[i]);
                },
                child: Card(
                  child: Column(
                    children: [
                      Text('${getTodoInitializedState.todoList[i].title}'),
                      Text(
                          '${getTodoInitializedState.todoList[i].description}'),
                      Text('${getTodoInitializedState.todoList[i].time}')
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
