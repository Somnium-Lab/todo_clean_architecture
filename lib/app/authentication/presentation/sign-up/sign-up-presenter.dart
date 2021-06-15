import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:todo_clean_architecture/app/authentication/domain/usecase/user-sign-up-usecase.dart';
import 'package:todo_clean_architecture/core/presentation/observer.dart';

class SignUpPresenter implements Presenter {
  final UserSignUpUsecase _userSignUpUsecase;

  SignUpPresenter(this._userSignUpUsecase);

  @override
  void dispose() {
    _userSignUpUsecase.dispose();
  }

  void checkUserIsSignUpStatus(
    UseCaseObserver observer, {
    required String email,
    required String password,
  }) {
    _userSignUpUsecase.execute(
      observer,
      new UserSignUpUsecaseParams(email: email, password: password),
    );
  }
}
