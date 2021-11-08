import 'package:chat_app/Widgets/widget.dart';
import 'package:chat_app/services/auth.dart';
import 'package:flutter/material.dart';

class SingIn extends StatefulWidget {
  const SingIn({Key? key}) : super(key: key);

  @override
  _SingInState createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
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
    setState(() {});
  }
}
