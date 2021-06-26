import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_clean_architecture/app/todo/domain/entity/todo-entity.dart';
import 'package:todo_clean_architecture/app/todo/domain/repository/todo-repository.dart';
import 'package:todo_clean_architecture/core/utility/firebase-keys.dart';

class TodoRepositoryImpl implements TodoRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  User getUser() {
    if (_firebaseAuth.currentUser != null) {
      return _firebaseAuth.currentUser!;
    } else {
      throw ('User : Null : TodoRepoImpl');
    }
  }

  @override
  Future<void> addTodo(
      {required String title, required String description}) async {
    User user = getUser();

    await _firebaseFirestore
        .collection(FirebaseKeys.collectionNameUsers)
        .doc(user.uid)
        .collection(FirebaseKeys.collectionNameTodoList)
        .add({
      FirebaseKeys.keyNameTitle: title,
      FirebaseKeys.keyNameDescription: description,
    });
  }

  @override
  Future<void> editTodo({
    required String title,
    required String description,
    required String itemId,
  }) async {
    User user = getUser();

    await _firebaseFirestore
        .collection(FirebaseKeys.collectionNameUsers)
        .doc(user.uid)
        .collection(FirebaseKeys.collectionNameTodoList)
        .doc(itemId)
        .set({
      FirebaseKeys.keyNameTitle: title,
      FirebaseKeys.keyNameDescription: description
    });
  }

  @override
  Future<List<TodoEntity>> getTodo() async {
    User user = getUser();

    List<TodoEntity> todolist = [];

    QuerySnapshot querySnapshot = await _firebaseFirestore
        .collection(FirebaseKeys.collectionNameUsers)
        .doc(user.uid)
        .collection(FirebaseKeys.collectionNameTodoList)
        .get();

    for (var i = 0; i < querySnapshot.docs.length; i++) {
      todolist.add(new TodoEntity(
          title: querySnapshot.docs[i][FirebaseKeys.keyNameTitle],
          description: querySnapshot.docs[i][FirebaseKeys.keyNameDescription],
          todoId: querySnapshot.docs[i].id,
          time: querySnapshot.docs[i][FirebaseKeys.keyNameTime]));
    }

    return todolist;
  }
}
