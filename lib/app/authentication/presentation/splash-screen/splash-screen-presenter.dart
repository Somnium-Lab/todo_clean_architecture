import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:todo_clean_architecture/app/authentication/domain/usecase/check-user-is-sign-in-usecase.dart';
import 'package:todo_clean_architecture/core/presentation/observer.dart';

class SplashScreenPresenter implements Presenter {
  final CheckUserSignInStateUsecase _checkUserSignInStateUsecase;

  SplashScreenPresenter(this._checkUserSignInStateUsecase);

  @override
  void dispose() {
    _checkUserSignInStateUsecase.dispose();
  }

  void checkUserSignInStatus(UseCaseObserver observer) {
    _checkUserSignInStateUsecase.execute(observer);
  }
}
