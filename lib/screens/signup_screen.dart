import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/screens/signin_screen.dart';

import '../reusable_widgets/reusable_widget.dart';
import '../utils/color_utils.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignUpScreenState createState() => _SignUpScreenState();
  }

  class _SignUpScreenState extends State<SignUpScreen> {
    String emailid = '';
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();

    @override
      Widget build(BuildContext context) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text("Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              hexStringToColor("CB2B93"), 
              hexStringToColor("9546C4"), 
              hexStringToColor("5E61F4")
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
   child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 120, 20, 400),
            child: Column(
              children: <Widget>[
                const SizedBox(
                height: 25,
                ),
            reusableTextField("Enter  Email", Icons.account_circle, false, _emailTextController),
              const SizedBox(
                height: 20
              ),
            reusableTextField("Enter Username", Icons.account_circle, false,_userNameTextController),
              const SizedBox(
                height: 25,
                ),
            reusableTextField("Enter Password", Icons.lock_outline, true,_passwordTextController),
              const SizedBox(
                height: 25,
                ),
                signInSignUpButton(context, false, () {
                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: _emailTextController.text, 
                    password: _passwordTextController.text).then((value) {
                   print("created new account");
                    Navigator.push(context, MaterialPageRoute(builder: ((context) => const SignInScreen(title: 'Sign Up',))));
                   }).onError((error, stackTrace) {
                    print("Error ${error.toString()}",
                    );
                  });
                }),
              ],
          ),
        ),
      ),
        ),
      );
    }
  }