import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_clean_architecture/app/authentication/domain/repository/auth-repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<void> userSignIn(
      {required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
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
