import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:todo_clean_architecture/app/authentication/domain/repository/auth-repository.dart';

class UserSignInUsecase extends CompletableUseCase<UserSignInUsecaseParams> {
  final AuthRepository _repository;
  UserSignInUsecase(this._repository);

  @override
  Future<Stream<void>> buildUseCaseStream(params) async {
    final StreamController<void> streamController = StreamController();
    try {
      await _repository.userSignIn(
        email: params!.email,
        password: params.password,
      );
      streamController.close();
    } catch (error) {
      print('error in user sign-in : $error :  UserSignInUsecase ');
      streamController.addError(error);
    }
    return streamController.stream;
  }
}

class UserSignInUsecaseParams {
  final String email;
  final String password;

  UserSignInUsecaseParams({
    required this.email,
    required this.password,
  });
}
