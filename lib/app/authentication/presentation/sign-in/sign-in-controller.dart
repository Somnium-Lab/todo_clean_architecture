import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/sign-in/sign-in-presenter.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/sign-in/sign-in-state-machine.dart';
import 'package:todo_clean_architecture/app/navigation-service.dart';
import 'package:todo_clean_architecture/injection-container.dart';

class SignInController extends Controller {
  final SignInPresenter _signInPresenter;
  final SignInStateMachine _signInStateMachine;
  final NavigationService _navigationService;

  SignInController()
      : _navigationService = serviceLocator<NavigationService>(),
        _signInPresenter = serviceLocator<SignInPresenter>(),
        _signInStateMachine = new SignInStateMachine(),
        super();

  @override
  void initListeners() {}

  @override
  void onDisposed() {
    _signInPresenter.dispose();
    super.onDisposed();
  }

  @override
  void onInitState() {
    super.onInitState();
  }

  SignInState getCurrentState() {
    return _signInStateMachine.getCurrentState();
  }
}
