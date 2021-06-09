import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/sign-up/sign-up-presenter.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/sign-up/sign-up-state-machine.dart';
import 'package:todo_clean_architecture/app/navigation-service.dart';
import 'package:todo_clean_architecture/injection-container.dart';

class SignUpController extends Controller {
  final SignUpPresenter _signUpPresenter;
  final SignUpStateMachine _signUpStateMachine;
  // ignore: unused_field
  final NavigationService _navigationService;

  SignUpController()
      : _navigationService = serviceLocator<NavigationService>(),
        _signUpPresenter = serviceLocator<SignUpPresenter>(),
        _signUpStateMachine = new SignUpStateMachine(),
        super();

  @override
  void initListeners() {}

  @override
  void onDisposed() {
    _signUpPresenter.dispose();
    super.onDisposed();
  }

  @override
  void onInitState() {
    super.onInitState();
  }

  SignUpState getCurrenState() {
    return _signUpStateMachine.getCurrentState();
  }
}
