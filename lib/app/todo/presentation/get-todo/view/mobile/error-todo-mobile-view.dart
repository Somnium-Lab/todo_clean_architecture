import 'package:flutter/material.dart';
import 'package:todo_clean_architecture/app/todo/presentation/get-todo/get-todo-controller.dart';

class ErrorTodoMobileView extends StatefulWidget {
  final GetTodoController getTodoController;

  const ErrorTodoMobileView({Key? key, required this.getTodoController})
      : super(key: key);

  @override
  _ErrorTodoMobileViewState createState() => _ErrorTodoMobileViewState();
}

class _ErrorTodoMobileViewState extends State<ErrorTodoMobileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          color: Colors.black,
          child: Text(
            'Error',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ));
  }
}
