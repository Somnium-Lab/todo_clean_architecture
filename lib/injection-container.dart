import 'package:get_it/get_it.dart';
import 'package:todo_clean_architecture/app/authentication/data/auth-repository-impl.dart';
import 'package:todo_clean_architecture/app/authentication/domain/repository/auth-repository.dart';
import 'package:todo_clean_architecture/app/authentication/domain/usecase/check-user-is-sign-in-usecase.dart';
import 'package:todo_clean_architecture/app/authentication/domain/usecase/user-sign-in-usecase.dart';
import 'package:todo_clean_architecture/app/authentication/domain/usecase/user-sign-out-usecase.dart';
import 'package:todo_clean_architecture/app/authentication/domain/usecase/user-sign-up-usecase.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/sign-in/sign-in-presenter.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/sign-up/sign-up-presenter.dart';
import 'package:todo_clean_architecture/app/authentication/presentation/splash-screen/splash-screen-presenter.dart';

import 'app/navigation-service.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //navigation
  serviceLocator.registerLazySingleton(() => NavigationService());

  //usecase
  //auth
  serviceLocator.registerFactory(
    () => CheckUserSignInStateUsecase(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => UserSignInUsecase(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => UserSignUpUsecase(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => UserSignOutUsecase(
      serviceLocator(),
    ),
  );

  //presenter
  serviceLocator.registerFactory(
    () => SignInPresenter(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => SignUpPresenter(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => SplashScreenPresenter(
      serviceLocator(),
    ),
  );

  //repository
  serviceLocator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(),
  );
}

Future<void> reset() async {
  serviceLocator.resetLazySingleton<AuthRepository>();
}
