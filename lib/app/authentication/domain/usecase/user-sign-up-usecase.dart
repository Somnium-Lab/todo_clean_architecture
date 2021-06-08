import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:todo_clean_architecture/app/authentication/domain/repository/auth-repository.dart';

class UserSignUpUsecase extends CompletableUseCase<UserSignUpUsecaseParams> {
  final AuthRepository _repository;
  UserSignUpUsecase(this._repository);

  @override
  Future<Stream<void>> buildUseCaseStream(params) async {
    final StreamController<void> streamController = StreamController();
    try {
      await _repository.userSignUp(
        email: params!.email,
        password: params.password,
      );
      streamController.close();
    } catch (error) {
      print('error in user signup : $error :  UserSignUpUsecase ');
      streamController.addError(error);
    }
    return streamController.stream;
  }
}

class UserSignUpUsecaseParams {
  final String email;
  final String password;

  UserSignUpUsecaseParams({
    required this.email,
    required this.password,
  });
}
