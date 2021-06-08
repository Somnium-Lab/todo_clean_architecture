import 'package:todo_clean_architecture/app/authentication/domain/repository/auth-repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  @override
  Future<void> userSignIn({required String email, required String password}) {
    // TODO: implement userSignIn
    throw UnimplementedError();
  }

  @override
  Future<void> userSignOut() {
    // TODO: implement userSignOut
    throw UnimplementedError();
  }

  @override
  Future<void> userSignUp({required String email, required String password}) {
    // TODO: implement userSignUp
    throw UnimplementedError();
  }
}