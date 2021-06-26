import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:todo_clean_architecture/app/navigation-service.dart';
import 'package:todo_clean_architecture/app/todo/presentation/update-todo/update-todo-presenter.dart';
import 'package:todo_clean_architecture/app/todo/presentation/update-todo/update-todo-state-machine.dart';
import 'package:todo_clean_architecture/core/presentation/observer.dart';
import 'package:todo_clean_architecture/injection-container.dart';

class UpdateTodoController extends Controller {
  final UpdateTodoPresenter _updateTodoPresenter;

  final UpdateTodoStateMachine _updateTodoStateMachine =
      new UpdateTodoStateMachine();

  // ignore: unused_field
  final NavigationService _navigationService =
      serviceLocator<NavigationService>();

  UpdateTodoController()
      : _updateTodoPresenter = serviceLocator<UpdateTodoPresenter>(),
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

  UpdateTodoState getCurrentState() {
    return _updateTodoStateMachine.getCurrentState();
  }

  void editTodo({
    required String title,
    required String description,
    required String itemId,
  }) {
    _updateTodoPresenter.editTodo(
      new UseCaseObserver(
        () {
          // _updateTodoStateMachine.onEvent(new UpdateTodoInitializationEvent());
          // refreshUI();
          _navigationService.navigateBack();
        },
        (error) {
          _updateTodoStateMachine.onEvent(new UpdateTodoErrorEvent());
          refreshUI();
        },
      ),
      title: title,
      description: description,
      itemId: itemId,
    );
  }
}
