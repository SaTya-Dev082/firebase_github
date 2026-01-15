import 'package:firebase_01/brew_crew/firebase_auth_flutter/screens/authentication/register.dart';
import 'package:firebase_01/brew_crew/firebase_auth_flutter/screens/authentication/sign_in.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool isSigIn = true;
  void toggleAuthentication() {
    setState(() {
      isSigIn = !isSigIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isSigIn) {
      return SignIn(toggleAuthentication: toggleAuthentication);
    } else {
      return Register(toggleAuthentication: toggleAuthentication);
    }
  }
}
