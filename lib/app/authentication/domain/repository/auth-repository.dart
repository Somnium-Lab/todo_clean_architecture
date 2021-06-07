abstract class AuthRepository {
  Future<void> userSignIn({
    required String email,
    required String password,
  });
}
