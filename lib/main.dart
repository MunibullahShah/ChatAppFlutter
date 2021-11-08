import 'package:chat_app/Screens/signin_screen.dart';
import 'package:chat_app/Screens/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp().whenComplete(() {
      print("Completed");
    });
    return MaterialApp(
      title: 'Chat App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUp(),
    );
  }
}
