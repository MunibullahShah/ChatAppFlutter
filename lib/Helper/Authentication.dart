// ignore_for_file: file_names

import 'package:chat_app/Screens/signin_screen.dart';
import 'package:chat_app/Screens/signup_screen.dart';
import 'package:flutter/material.dart';

/* This class is for toggle between signIn and signUp
*/
class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showSignIn ? SignIn(toggleView()) : SignUp(toggleView());
  }
}
