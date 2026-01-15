import 'package:firebase_01/brew_crew/firebase_auth_flutter/services/auth_service.dart';
import 'package:firebase_01/brew_crew/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final AuthService _authService = AuthService();
  // final user=UserModel(uid: );
  User? userModel = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _authService.signOut();
            },
            icon: Icon(Icons.login),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "E-mail : ${userModel!.email}",
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            SizedBox(height: 20),
            Text(
              "Uid : ${userModel!.uid}",
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
