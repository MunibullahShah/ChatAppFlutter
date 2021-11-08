// ignore_for_file: prefer_const_constructors

import 'package:chat_app/Screens/chatroomscreen.dart';
import 'package:chat_app/Screens/signin_screen.dart';
import 'package:chat_app/Widgets/widget.dart';
import 'package:chat_app/services/auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  SignUp();

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  TextEditingController usernameEditingController = new TextEditingController();

  AuthMethods authService = new AuthMethods();

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  singUp() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      await authService
          .signUpWithEmailAndPassword(
              emailEditingController.text, passwordEditingController.text)
          .then((result) {
        print("result: $result");
        if (result != null) {
          Map<String, String> userDataMap = {
            "userName": usernameEditingController.text,
            "userEmail": emailEditingController.text
          };
          print("Signed Up and User: $userDataMap");
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => ChatroomScreen()));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Chat"),
      ),
      body: isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Spacer(),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          style: TextStyle(fontSize: 16),
                          controller: usernameEditingController,
                          validator: (val) {
                            return val!.isEmpty || val.length < 3
                                ? "Enter Username 3+ characters"
                                : null;
                          },
                          decoration: InputDecoration(
                            hintText: "username",
                          ),
                        ),
                        TextFormField(
                          controller: emailEditingController,
                          validator: (val) {
                            return RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(val!)
                                ? null
                                : "Enter correct email";
                          },
                          decoration: InputDecoration(
                            hintText: "email",
                          ),
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "password",
                          ),
                          controller: passwordEditingController,
                          validator: (val) {
                            return val!.length < 6
                                ? "Enter Password 6+ characters"
                                : null;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      singUp();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xff007EF4),
                              const Color(0xff2A75BC)
                            ],
                          )),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Sign Up with Google",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute<dynamic>(
                                builder: (BuildContext context) => SingIn(),
                              ),
                              (route) => false);
                        },
                        child: const Text(
                          "SignIn now",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
    );
    ;
  }
}
