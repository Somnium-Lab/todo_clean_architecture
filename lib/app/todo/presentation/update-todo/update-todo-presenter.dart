import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:todo_clean_architecture/app/todo/domain/usecase/update-todo-usecase.dart';
import 'package:todo_clean_architecture/core/presentation/observer.dart';

class UpdateTodoPresenter implements Presenter {
  final UpdateTodoUsecase _updateTodoUsecase;

  UpdateTodoPresenter(this._updateTodoUsecase);

  @override
  void dispose() {
    _updateTodoUsecase.dispose();
  }

  void editTodo(
    UseCaseObserver observer, {
    required String title,
    required String description,
    required String itemId,
  }) {
    _updateTodoUsecase.execute(
        observer,
        new UpdateTodoUsecaseParams(
          title: title,
          description: description,
          itemId: itemId,
        ));
  }
}
