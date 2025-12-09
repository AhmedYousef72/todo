import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/firebase_functions.dart';
import 'package:todo/models/user_model.dart';
import 'package:easy_localization/easy_localization.dart';

class MyProvider extends ChangeNotifier {
  UserModel? userModel;
  User? firebaseUser;

  ThemeMode mode = ThemeMode.light;

  bool _disposed = false;

  MyProvider() {
    firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      initUser();
    }
    _loadTheme();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  void _safeNotify() {
    if (!_disposed) notifyListeners();
  }

  initUser() async {
    userModel = await FirebaseFunctions.readUserData();
    _safeNotify();
  }

  // Theme Management
  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('isDark') ?? false;
    mode = isDark ? ThemeMode.dark : ThemeMode.light;
    _safeNotify();
  }

  Future<void> changeTheme(ThemeMode newMode) async {
    mode = newMode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', newMode == ThemeMode.dark);
    _safeNotify();
  }

  // Language (optional helper)
  Future<void> changeLanguage(BuildContext context, String code) async {
    await context.setLocale(Locale(code));
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', code);
    _safeNotify();
  }
}
