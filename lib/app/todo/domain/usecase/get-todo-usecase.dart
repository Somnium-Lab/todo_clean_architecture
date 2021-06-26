import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:todo_clean_architecture/app/todo/domain/entity/todo-entity.dart';
import 'package:todo_clean_architecture/app/todo/domain/repository/todo-repository.dart';

class GetTodoUsecase extends CompletableUseCase<void> {
  final TodoRepository _todoRepository;

  GetTodoUsecase(this._todoRepository);

  @override
  Future<Stream<List<TodoEntity>>> buildUseCaseStream(params) async {
    final StreamController<List<TodoEntity>> streamController =
        StreamController();

    try {
      List<TodoEntity> _todoList = await _todoRepository.getTodo();
      streamController.add(_todoList);
      streamController.close();
    } catch (e) {
      print("Error : $e Get Todo Usecase ");
      streamController.addError(e);
    }

    return streamController.stream;
  }
}
