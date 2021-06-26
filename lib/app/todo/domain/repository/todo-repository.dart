import 'package:todo_clean_architecture/app/todo/domain/entity/todo-entity.dart';

abstract class TodoRepository {
  Future<void> addTodo({
    required String title,
    required String description,
  });

  Future<List<TodoEntity>> getTodo();

  Future<void> editTodo(
      {required String title,
      required String description,
      required String itemId});
}
