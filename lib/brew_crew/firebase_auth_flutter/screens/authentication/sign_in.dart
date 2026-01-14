import 'package:firebase_01/brew_crew/firebase_auth_flutter/services/auth_service.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign In to Brew Crew"), centerTitle: true),
      body: Center(
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: Colors.blue,
          onPressed: () async {
            var result = await _auth.signInAnonymous();
            if (result != null) {
              print("Sign In");
              print("Result : ${result.uid}");
            } else {
              print("Error Sign In");
            }
          },
          child: Text("Sign In Anonymous"),
        ),
      ),
    );
  }
}
