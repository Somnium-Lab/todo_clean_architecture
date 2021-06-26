import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:todo_clean_architecture/app/authentication/domain/usecase/user-sign-in-usecase.dart';
import 'package:todo_clean_architecture/core/presentation/observer.dart';

class SignInPresenter implements Presenter {
  final UserSignInUsecase _userSignInUsecase;

  SignInPresenter(this._userSignInUsecase);

  @override
  void dispose() {}

  void checkUserIsSignIn(UseCaseObserver observer,
      {required String email, required String password}) {
    _userSignInUsecase.execute(observer);
  }

  void userSignInStatus(
    UseCaseObserver observer, {
    required String email,
    required password,
  }) {
    _userSignInUsecase.execute(
      observer,
      new UserSignInUsecaseParams(
        email: email,
        password: password,
      ),
    );
  }
}
