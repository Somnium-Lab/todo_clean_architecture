import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:todo_clean_architecture/app/todo/domain/repository/todo-repository.dart';

class AddTodoUsecase extends CompletableUseCase<AddTodoUsecaseParams> {
  final TodoRepository _todoRepository;

  AddTodoUsecase(this._todoRepository);

  @override
  Future<Stream<void>> buildUseCaseStream(params) async {
    final StreamController streamController = StreamController();

    try {
      await _todoRepository.addTodo(
          title: params!.title, description: params.description);
      streamController.close();
    } catch (e) {
      print('Error : $e : Add Todo Usecase ');
      streamController.addError(e);
    }

    return streamController.stream;
  }
}

class AddTodoUsecaseParams {
  final String title;
  final String description;

  AddTodoUsecaseParams({
    required this.title,
    required this.description,
  });
}
