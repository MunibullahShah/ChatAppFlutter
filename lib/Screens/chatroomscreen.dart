// ignore_for_file: prefer_const_constructors

import 'package:chat_app/Screens/signup_screen.dart';
import 'package:chat_app/services/auth.dart';
import 'package:flutter/material.dart';

class ChatroomScreen extends StatefulWidget {
  const ChatroomScreen({Key? key}) : super(key: key);

  @override
  _ChatroomScreenState createState() => _ChatroomScreenState();
}

class _ChatroomScreenState extends State<ChatroomScreen> {
  AuthMethods auth = new AuthMethods();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Chat Room"),
          actions: [
            GestureDetector(
              onTap: () {
                auth.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUp(),
                  ),
                );
              },
              child: Container(
                child: Icon(Icons.exit_to_app),
                padding: EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
