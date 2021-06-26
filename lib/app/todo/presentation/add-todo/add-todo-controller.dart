import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:todo_clean_architecture/app/navigation-service.dart';
import 'package:todo_clean_architecture/app/todo/presentation/add-todo/add-todo-presenter.dart';
import 'package:todo_clean_architecture/app/todo/presentation/add-todo/add-todo-state-machine.dart';
import 'package:todo_clean_architecture/core/presentation/observer.dart';
import 'package:todo_clean_architecture/injection-container.dart';

class AddTodoController extends Controller {
  final AddTodoPresenter _addTodoPresenter;
  final AddTodoStateMachine _addTodoStateMachine = new AddTodoStateMachine();

  // ignore: unused_field
  final NavigationService _navigationService =
      serviceLocator<NavigationService>();

  AddTodoController()
      : _addTodoPresenter = serviceLocator<AddTodoPresenter>(),
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

  AddTodoState getCurrentState() {
    return _addTodoStateMachine.getCurrentState();
  }

  void addTodo({required String title, required String description}) {
    _addTodoPresenter.addTodo(
      new UseCaseObserver(
        () {
          // _addTodoStateMachine.onEvent(new AddTodoInitializationEvent());
          // refreshUI();
          _navigationService.navigateBack();
        },
        (error) {
          _addTodoStateMachine.onEvent(new AddTodoErrorEvent());
          refreshUI();
        },
      ),
      title: title,
      description: description,
    );
  }
}
