import 'package:flutter/material.dart';
import 'package:todo_clean_architecture/app/todo/domain/entity/todo-entity.dart';
import 'package:todo_clean_architecture/app/todo/presentation/update-todo/update-todo-controller.dart';

class UpdateTodoBodyContent extends StatelessWidget {
  const UpdateTodoBodyContent({
    Key? key,
    required this.titleTextEditingController,
    required this.descriptionTextEditingController,
    required this.updateTodoController,
    required this.task,
  }) : super(key: key);

  final TodoEntity task;

  final UpdateTodoController updateTodoController;

  final TextEditingController titleTextEditingController;

  final TextEditingController descriptionTextEditingController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
            child: Column(
          children: [
            SizedBox(height: 10),
            Text('Title : '),
            SizedBox(height: 10),
            TextFormField(
              controller: titleTextEditingController,
              decoration: InputDecoration(
                labelText: "Title : ",
              ),
            ),
            SizedBox(height: 10),
            Text('Description : '),
            SizedBox(height: 10),
            TextFormField(
              controller: descriptionTextEditingController,
              decoration: InputDecoration(
                labelText: "Title : ",
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                if (titleTextEditingController.text.isNotEmpty &&
                    descriptionTextEditingController.text.isNotEmpty) {
                  updateTodoController.editTodo(
                    title: titleTextEditingController.text,
                    description: descriptionTextEditingController.text,
                    itemId: task.todoId,
                  );
                }
              },
              child: Text('SAVE'),
            ),
          ],
        )),
      ),
    );
  }
}
