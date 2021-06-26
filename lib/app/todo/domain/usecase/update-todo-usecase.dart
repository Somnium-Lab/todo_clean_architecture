import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:todo_clean_architecture/app/todo/domain/repository/todo-repository.dart';

class UpdateTodoUsecase extends CompletableUseCase<UpdateTodoUsecaseParams> {
  final TodoRepository _todoRepository;

  UpdateTodoUsecase(this._todoRepository);

  @override
  Future<Stream<void>> buildUseCaseStream(params) async {
    final StreamController streamController = StreamController();

    try {
      await _todoRepository.editTodo(
        title: params!.title,
        description: params.description,
        itemId: params.itemId,
      );
      streamController.close();
    } catch (e) {
      print('Error : $e : Update Todo Usecase ');
      streamController.addError(e);
    }

    return streamController.stream;
  }
}

class UpdateTodoUsecaseParams {
  final String title;
  final String description;
  final String itemId;

  UpdateTodoUsecaseParams({
    required this.title,
    required this.description,
    required this.itemId,
  });
}
