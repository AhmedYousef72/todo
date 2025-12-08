import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/tabs/editTask_screen.dart';
import 'package:todo/firebase_options.dart';
import 'package:todo/home_screen.dart';
import 'package:todo/providers/my_provider.dart';
import 'package:todo/register/login.dart';
import 'package:todo/register/signUp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      initialRoute: provider.firebaseUser != null
          ? HomeScreen.routeName
          : LoginScreen.routeName,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => LoginScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
        EdittaskScreen.routename: (context) => EdittaskScreen(),
      },
    );
  }
}
