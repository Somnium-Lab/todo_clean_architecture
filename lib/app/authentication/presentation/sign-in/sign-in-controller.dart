import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/sign-in/sign-in-presenter.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/sign-in/sign-in-state-machine.dart';
import 'package:todo_clean_architecture/app/navigation-service.dart';
import 'package:todo_clean_architecture/core/presentation/observer.dart';
import 'package:todo_clean_architecture/injection-container.dart';

class SignInController extends Controller {
  final SignInPresenter _signInPresenter;
  final SignInStateMachine _signInStateMachine;
  // ignore: unused_field
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

  void userSignIn({required String email, required String password}) {
    _signInPresenter.checkUserIsSignIn(
      new UseCaseObserver(
        () {
          _navigationService.navigateTo(NavigationService.homePageRoute,
              shouldReplace: true);
        },
        (error) {
          _signInStateMachine.onEvent(new SignInErrorEvent());
          refreshUI();
        },
      ),
      email: email,
      password: password,
    );
  }
}
