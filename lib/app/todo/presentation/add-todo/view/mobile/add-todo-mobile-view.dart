import 'package:flutter/material.dart';
import 'package:todo_clean_architecture/app/todo/presentation/add-todo/add-todo-controller.dart';
import 'package:todo_clean_architecture/app/todo/presentation/add-todo/view/widget/add-todo-body-content.dart';

class AddTodoMobileView extends StatefulWidget {
  final AddTodoController addTodoController;
  const AddTodoMobileView({Key? key, required this.addTodoController})
      : super(key: key);

  @override
  _AddTodoMobileViewState createState() => _AddTodoMobileViewState();
}

class _AddTodoMobileViewState extends State<AddTodoMobileView> {
  late final TextEditingController _titleTextEditingController;
  late final TextEditingController _descriptionTextEditingController;

  @override
  void initState() {
    _titleTextEditingController = new TextEditingController();
    _descriptionTextEditingController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          child: AddTodoBodyContent(
              addTodoController: widget.addTodoController,
              titleTextEditingController: _titleTextEditingController,
              descriptionTextEditingController:
                  _descriptionTextEditingController)),
    );
  }
}
