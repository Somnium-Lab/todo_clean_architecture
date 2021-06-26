import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_clean_architecture/app/authentication/domain/repository/auth-repository.dart';
import 'package:todo_clean_architecture/core/utility/firebase-keys.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<void> userSignIn(
      {required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<void> userSignOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> userSignUp(
      {required String email, required String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _firebaseFirestore
        .collection(FirebaseKeys.collectionNameUsers)
        .doc(_firebaseAuth.currentUser!.uid)
        .set({FirebaseKeys.userEmail: email});
  }

  @override
  bool checkUserSignInStatus() {
    if (_firebaseAuth.currentUser == null)
      return false;
    else
      return true;
  }
}
