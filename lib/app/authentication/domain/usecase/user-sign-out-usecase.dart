import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:todo_clean_architecture/app/authentication/domain/repository/auth-repository.dart';

class UserSplashScreenUsecase extends CompletableUseCase<void> {
  final AuthRepository _repository;
  UserSplashScreenUsecase(this._repository);

  @override
  Future<Stream<void>> buildUseCaseStream(params) async {
    final StreamController<void> streamController = StreamController();
    try {
      await _repository.userSplashScreen();
      streamController.close();
    } catch (error) {
      print('error in user sign out  : $error :  UserSplashScreenUsecase ');
      streamController.addError(error);
    }
    return streamController.stream;
  }
}
