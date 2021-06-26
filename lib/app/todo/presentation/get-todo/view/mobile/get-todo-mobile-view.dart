import 'package:flutter/material.dart';
import 'package:todo_clean_architecture/app/todo/presentation/get-todo/get-todo-controller.dart';
import 'package:todo_clean_architecture/app/todo/presentation/get-todo/get-todo-state-machine.dart';
import 'package:todo_clean_architecture/app/todo/presentation/get-todo/view/widget/get-todo-body-content-mobile-view.dart';

class GetTodoMobileView extends StatefulWidget {
  final GetTodoController getTodoController;
  final GetTodoInitializedState getTodoInitializedState;
  const GetTodoMobileView({
    Key? key,
    required this.getTodoController,
    required this.getTodoInitializedState,
  }) : super(key: key);

  @override
  _GetTodoMobileViewState createState() => _GetTodoMobileViewState();
}

class _GetTodoMobileViewState extends State<GetTodoMobileView> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GetTodoBodyContentMobileView(
          getTodoController: widget.getTodoController,
          getTodoInitializedState: widget.getTodoInitializedState,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.getTodoController.navigateToAddPage();
        },
        child: Icon(Icons.plus_one_sharp),
      ),
    );
  }
}
