// ignore_for_file: prefer_const_constructors

import 'package:chat_app/Screens/signup_screen.dart';
import 'package:chat_app/services/firebaseMethods.dart';
import 'package:flutter/material.dart';

import 'chatroomscreen.dart';

class SignIn extends StatefulWidget {
  final toggle;

  SignIn(this.toggle);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _isloading = false;

  AuthMethods authMethods = new AuthMethods();
  TextEditingController userNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Chat"),
        ),
        body: _isloading
            ? Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    TextField(
                      controller: emailController,
                      onChanged: (value) {},
                      decoration: const InputDecoration(
                        hintText: "Email",
                      ),
                    ),
                    TextField(
                      controller: passwordController,
                      onChanged: (value) {},
                      decoration: const InputDecoration(
                        hintText: "Password",
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        signIn(emailController.text, passwordController.text);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 20,
                        width: MediaQuery.of(context).size.width - 200,
                        color: Colors.blue,
                        child: const Text("Sign In"),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute<dynamic>(
                                builder: (BuildContext context) =>
                                    SignUp(widget.toggle),
                              ),
                              (route) => false);
                        });
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  signIn(String email, String password) {
    setState(() {
      _isloading = true;
    });
    authMethods.signInWithEmail(email, password)!.then((value) {
      print("$value");
    });
    _isloading = false;
    setState(() {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ChatroomScreen()));
    });
  }
}
