import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/splash-screen/splash-screen-presenter.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/splash-screen/splash-screen-state-machine.dart';
import 'package:todo_clean_architecture/app/navigation-service.dart';
import 'package:todo_clean_architecture/core/presentation/observer.dart';
import 'package:todo_clean_architecture/injection-container.dart';

class SplashScreenController extends Controller {
  final SplashScreenPresenter _splashScreenPresenter;
  final SplashScreenStateMachine _splashScreenStateMachine;
  // ignore: unused_field
  final NavigationService _navigationService;

  SplashScreenController()
      : _navigationService = serviceLocator<NavigationService>(),
        _splashScreenPresenter = serviceLocator<SplashScreenPresenter>(),
        _splashScreenStateMachine = new SplashScreenStateMachine();

  @override
  void initListeners() {}

  @override
  void onDisposed() {
    _splashScreenPresenter.dispose();
    super.onDisposed();
  }

  @override
  void onInitState() {
    super.onInitState();
  }

  SplashScreenState getCurrentState() {
    return _splashScreenStateMachine.getCurrentState();
  }

  void checkUserIsSign() {
    _splashScreenPresenter.checkUserSignInStatus(
      new UseCaseObserver(
        () {},
        (error) {
          _navigationService.navigateTo(NavigationService.signInPageRoute,
              shouldReplace: true);
        },
        onNextFunc: (bool signInStatus) {
          if (signInStatus) {
            _navigationService.navigateTo(NavigationService.homePageRoute,
                shouldReplace: true);
          } else {
            _navigationService.navigateTo(NavigationService.signInPageRoute);
          }
        },
      ),
    );
  }
}
