import 'package:flutter/material.dart';
import 'package:todo_clean_architecture/app/todo/presentation/add-todo/add-todo-controller.dart';

class LoadingView extends StatefulWidget {
  final AddTodoController addTodoController;

  const LoadingView({Key? key, required this.addTodoController})
      : super(key: key);

  @override
  _LoadingViewState createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
