import 'package:flutter/material.dart';
import 'package:todo_clean_architecture/app/todo/presentation/get-todo/get-todo-controller.dart';

class LoadingView extends StatefulWidget {
  final GetTodoController getTodoController;

  const LoadingView({Key? key, required this.getTodoController})
      : super(key: key);

  @override
  _LoadingViewState createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  @override
  Widget build(BuildContext context) {
    widget.getTodoController.getTodo();
   
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
