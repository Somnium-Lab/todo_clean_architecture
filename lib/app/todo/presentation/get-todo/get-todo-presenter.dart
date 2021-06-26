import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:todo_clean_architecture/app/todo/domain/usecase/get-todo-usecase.dart';
import 'package:todo_clean_architecture/core/presentation/observer.dart';

class GetTodoPresenter implements Presenter {
  final GetTodoUsecase _getTodoUsecase;

  GetTodoPresenter(this._getTodoUsecase);

  @override
  void dispose() {
    _getTodoUsecase.dispose();
  }

  void getTodo(UseCaseObserver observer) {
    _getTodoUsecase.execute(observer);
  }
}
