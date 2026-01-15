import 'package:firebase_01/brew_crew/firebase_auth_flutter/screens/authentication/register.dart';
import 'package:firebase_01/brew_crew/firebase_auth_flutter/screens/authentication/sign_in.dart';
import 'package:firebase_01/brew_crew/firebase_auth_flutter/screens/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_01/brew_crew/model/user.dart';
import 'package:provider/provider.dart';
import 'authentication/authentication.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    if (user != null) {
      return Home();
    } else {
      return Authentication();
    }
  }
}
