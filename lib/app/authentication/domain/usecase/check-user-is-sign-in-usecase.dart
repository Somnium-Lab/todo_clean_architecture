import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:todo_clean_architecture/app/authentication/domain/repository/auth-repository.dart';

class CheckUserSignInStateUsecase extends CompletableUseCase<void> {
  final AuthRepository _repository;
  CheckUserSignInStateUsecase(this._repository);

  @override
  Future<Stream<void>> buildUseCaseStream(void params) async {
    final StreamController<void> streamController = StreamController();

    try {
      bool loginStatus = _repository.checkUserSignInStatus();
      streamController.add(loginStatus);
      streamController.close();
    } catch (error) {
      print("error in getting tags : $error : CheckUserLoginStatusUsecase");
      streamController.addError(error);
    }

    return streamController.stream;
  }
}
