import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:todo_clean_architecture/app/navigation-service.dart';
import 'package:todo_clean_architecture/app/todo/domain/entity/todo-entity.dart';
import 'package:todo_clean_architecture/app/todo/presentation/get-todo/get-todo-presenter.dart';
import 'package:todo_clean_architecture/app/todo/presentation/get-todo/get-todo-state-machine.dart';
import 'package:todo_clean_architecture/app/todo/presentation/update-todo/view/update-todo-view.dart';
import 'package:todo_clean_architecture/core/presentation/observer.dart';
import 'package:todo_clean_architecture/injection-container.dart';

class GetTodoController extends Controller {
  // ignore: unused_field
  final GetTodoPresenter _getTodoPresenter;

  final GetTodoStateMachine _getTodoStateMachine = new GetTodoStateMachine();
  // ignore: unused_field
  final NavigationService _navigationService =
      serviceLocator<NavigationService>();
  GetTodoController()
      : _getTodoPresenter = serviceLocator<GetTodoPresenter>(),
        super();

  @override
  void initListeners() {}

  @override
  void onInitState() {
    super.onInitState();
  }

  @override
  void onDisposed() {
    super.onDisposed();
  }

  GetTodoState getCurrentState() {
    return _getTodoStateMachine.getCurrentState();
  }

  void getTodo() {
    new UseCaseObserver(() {
      // _getTodoStateMachine.onEvent(new GetTodoInitializationEvent());
      // refreshUI();
    }, (error) {
      _getTodoStateMachine.onEvent(new GetTodoErrorEvent());
      refreshUI();
    }, onNextFunc: (List<TodoEntity> todoList) {
      _getTodoStateMachine
          .onEvent(new GetTodoInitializedEvent(todoList: todoList));
      refreshUI();
    });
  }

  void navigateToUpdatePage({required TodoEntity task}) {
    _navigationService.navigateTo(NavigationService.updateTodoPageRoute,
        arguments: new UpdateTodoViewParams(task));
  }

  void navigateToAddPage() {
    _navigationService.navigateTo(NavigationService.addTodoPageRoute);
  }
}
