import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/firebase_functions.dart';
import 'package:todo/models/user_model.dart';

class MyProvider extends ChangeNotifier {
  UserModel? userModel;
  User? firebaseUser;
  initUser() async {
    userModel = await FirebaseFunctions.readUserData();
    notifyListeners();
  }

  MyProvider() {
    firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      initUser();
    }
  }
}
