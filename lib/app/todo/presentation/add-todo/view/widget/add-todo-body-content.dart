import 'package:flutter/material.dart';
import 'package:todo_clean_architecture/app/todo/presentation/add-todo/add-todo-controller.dart';

class AddTodoBodyContent extends StatelessWidget {
  const AddTodoBodyContent(
      {Key? key,
      required this.addTodoController,
      required this.titleTextEditingController,
      required this.descriptionTextEditingController})
      : super(key: key);
  final AddTodoController addTodoController;

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
            Text("TTILE : "),
            SizedBox(height: 10),
            TextFormField(
              controller: titleTextEditingController,
              decoration:
                  InputDecoration(labelText: "Title", hintText: "Add Title"),
            ),
            SizedBox(height: 10),
            Text("Description : "),
            SizedBox(height: 10),
            TextFormField(
              controller: descriptionTextEditingController,
              decoration: InputDecoration(
                  labelText: "Description", hintText: "Add Description"),
            ),
            TextButton(
                onPressed: () {
                  if (titleTextEditingController.text.isNotEmpty &&
                      descriptionTextEditingController.text.isNotEmpty) {
                    addTodoController.addTodo(
                      title: titleTextEditingController.text,
                      description: descriptionTextEditingController.text,
                    );
                  }
                },
                child: Text('Add'))
          ],
        ),
      )),
    );
  }
}
