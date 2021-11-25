import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //initialize fire base in proj
  await Firebase.initializeApp(); //initialize fire base in proj
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "RobotoSlab",
        primarySwatch: Colors.pink,
      ),
      home: LoginScreen(),
    );
  }
}
