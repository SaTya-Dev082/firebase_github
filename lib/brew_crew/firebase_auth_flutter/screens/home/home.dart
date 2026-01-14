import 'package:firebase_01/brew_crew/firebase_auth_flutter/services/auth_service.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final AuthService _authService = AuthService();
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
    );
  }
}
