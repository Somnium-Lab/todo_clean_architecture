import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:todo_clean_architecture/app/todo/domain/usecase/add-todo-usecase.dart';
import 'package:todo_clean_architecture/core/presentation/observer.dart';

class AddTodoPresenter implements Presenter {
  final AddTodoUsecase _addTodoUsecase;

  AddTodoPresenter(this._addTodoUsecase);

  @override
  void dispose() {
    _addTodoUsecase.dispose();
  }

  void addTodo(
    UseCaseObserver observer, {
    required String title,
    required String description,
  }) {
    _addTodoUsecase.execute(
        observer,
        new AddTodoUsecaseParams(
          title: title,
          description: description,
        ));
  }
}
