import 'package:flutter/material.dart';
import 'package:todo_clean_architecture/app/todo/presentation/update-todo/update-todo-controller.dart';

class ErrorUpdateTodoMobileView extends StatefulWidget {
  final UpdateTodoController updateTodoController;

  const ErrorUpdateTodoMobileView(
      {Key? key, required this.updateTodoController})
      : super(key: key);

  @override
  _ErrorTodoMobileViewState createState() => _ErrorTodoMobileViewState();
}

class _ErrorTodoMobileViewState extends State<ErrorUpdateTodoMobileView> {
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
