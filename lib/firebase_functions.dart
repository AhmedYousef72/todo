import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/models/user_model.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModel> getTaskCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
          fromFirestore: (snapshot, _) {
            return TaskModel.fromJson(snapshot.data()!);
          },
          toFirestore: (task, _) {
            return task.toJson();
          },
        );
  }

  static CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) {
            return UserModel.fromJson(snapshot.data()!);
          },
          toFirestore: (task, _) {
            return task.toJson();
          },
        );
  }

  static Future<void> addTask(TaskModel task) {
    var collection = getTaskCollection();
    var docRef = collection.doc();
    task.id = docRef.id;
    return docRef.set(task);
  }

  static addUser(UserModel userModel) {
    var collection = getUsersCollection();
    var docRef = collection.doc(userModel.id);
    return docRef.set(userModel);
  }
  // static Future<QuerySnapshot<TaskModel>> getTask() {
  //   var collection = getTaskCollection();
  //   return collection.get();
  // }

  /// Another way to get the data instant quickly

  static Stream<QuerySnapshot<TaskModel>> getTask(DateTime date) {
    var collection = getTaskCollection();
    return collection
        .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where(
          'date',
          isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch,
        )
        .snapshots();
  }

  static Future<void> deleteTask(String id) {
    return getTaskCollection().doc(id).delete();
  }

  static Future<void> updateTask(TaskModel taskModel) {
    return getTaskCollection().doc(taskModel.id).update(taskModel.toJson());
  }

  static Future<void> createAccount(
    String emailAddress,
    String password, {
    required Function onSuccess,
    required Function onError,
    required String username,
    required int age,
    required String email,
    required String phone,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
      await credential.user?.sendEmailVerification();
      UserModel userModel = UserModel(
        Username: username,
        age: age,
        email: email,
        phone: phone,
        id: credential.user!.uid,
      );
      await addUser(userModel);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      onError(e.message ?? 'Account creation failed');
    } catch (e) {
      onError('Error: ${e.toString()}');
    }
  }

  static Future<void> login(
    String emailAddress,
    String password, {
    required Function onSuccess,
    required Function onError,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      if (credential.user?.emailVerified == true) {
        onSuccess();
      } else {
        onError(
          'Please verify your email before logging in. Check your inbox.',
        );
      }
    } on FirebaseAuthException catch (e) {
      onError(e.message ?? 'Login failed');
    } catch (e) {
      onError('Login failed: ${e.toString()}');
    }
  }

  static Future<UserModel?> readUserData() async {
    var collection = getUsersCollection();
    DocumentSnapshot<UserModel> docUser = await collection
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    return docUser.data();
  }
}
