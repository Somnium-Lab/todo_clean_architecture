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
import 'package:todo_clean_architecture/app/todo/data/todo-repository-impl.dart';
import 'package:todo_clean_architecture/app/todo/domain/repository/todo-repository.dart';
import 'package:todo_clean_architecture/app/todo/domain/usecase/add-todo-usecase.dart';
import 'package:todo_clean_architecture/app/todo/domain/usecase/get-todo-usecase.dart';
import 'package:todo_clean_architecture/app/todo/domain/usecase/update-todo-usecase.dart';
import 'package:todo_clean_architecture/app/todo/presentation/add-todo/add-todo-presenter.dart';
import 'package:todo_clean_architecture/app/todo/presentation/get-todo/get-todo-presenter.dart';
import 'package:todo_clean_architecture/app/todo/presentation/update-todo/update-todo-presenter.dart';

import 'app/navigation-service.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //navigation
  serviceLocator.registerLazySingleton(() => NavigationService());

  //usecase
  //auth

  serviceLocator.registerFactory(() => GetTodoUsecase(serviceLocator()));

  serviceLocator.registerFactory(() => AddTodoUsecase(serviceLocator()));

  serviceLocator.registerFactory(() => UpdateTodoUsecase(serviceLocator()));

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

  serviceLocator.registerFactory(() => GetTodoPresenter(serviceLocator()));

  serviceLocator.registerFactory(() => AddTodoPresenter(serviceLocator()));

  serviceLocator.registerFactory(() => UpdateTodoPresenter(serviceLocator()));

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

  serviceLocator
      .registerLazySingleton<TodoRepository>(() => TodoRepositoryImpl());
}

Future<void> reset() async {
  serviceLocator.resetLazySingleton<AuthRepository>();
  serviceLocator.resetLazySingleton<TodoRepository>();
}
