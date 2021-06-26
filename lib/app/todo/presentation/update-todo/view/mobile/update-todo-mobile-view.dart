import 'package:flutter/material.dart';
import 'package:todo_clean_architecture/app/todo/domain/entity/todo-entity.dart';
import 'package:todo_clean_architecture/app/todo/presentation/update-todo/update-todo-controller.dart';
import 'package:todo_clean_architecture/app/todo/presentation/update-todo/view/widget/update-todo-body-content-mobile-view.dart';

class UpdateTodoMobileView extends StatefulWidget {
  final UpdateTodoController updateTodoController;
  final TodoEntity task;
  const UpdateTodoMobileView(
      {Key? key, required this.updateTodoController, required this.task})
      : super(key: key);

  @override
  _UpdateTodoMobileViewState createState() => _UpdateTodoMobileViewState();
}

class _UpdateTodoMobileViewState extends State<UpdateTodoMobileView> {
  late final TextEditingController titleTextEditingController;

  late final TextEditingController descriptionTextEditingController;

  void initState() {
    titleTextEditingController =
        new TextEditingController(text: widget.task.title);
    descriptionTextEditingController =
        new TextEditingController(text: widget.task.description);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          child: UpdateTodoBodyContent(
        titleTextEditingController: titleTextEditingController,
        descriptionTextEditingController: descriptionTextEditingController,
        updateTodoController: widget.updateTodoController,
        task: widget.task,
      )),
    );
  }
}
