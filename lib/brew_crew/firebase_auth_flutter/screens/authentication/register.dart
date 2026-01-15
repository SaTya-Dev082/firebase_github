import 'package:firebase_01/brew_crew/firebase_auth_flutter/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Register extends StatefulWidget {
  Register({super.key, required this.toggleAuthentication});
  final Function toggleAuthentication;

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String error = "";

  // Condition state
  bool loading = false;
  Widget loadingView() {
    return Container(
      color: Colors.transparent,
      child: Center(child: SpinKitCircle(color: Colors.blue, size: 30)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up to Brew Crew"),
        centerTitle: true,
        actions: [
          TextButton.icon(
            onPressed: () {
              widget.toggleAuthentication();
            },

            label: Text("Login"),
            icon: Icon(Icons.login),
            // child: Text("Register"),
          ),
        ],
      ),
      body: loading
          ? loadingView()
          : Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email required!";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "abc@gmail.com",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password required ";
                        }
                        if (value.length < 8) {
                          return "Password must be greater than 8 digit";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "abF\$435HKSJ@)954",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    MaterialButton(
                      height: 50,
                      textColor: Colors.black,
                      minWidth: 400,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      color: Colors.blue,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          final result = await _auth
                              .registerWithEmailAndPassword(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                          if (result == null) {
                            setState(() {
                              error = "Please supply a valid email";
                              loading = false;
                            });
                          }
                        }
                      },
                      child: Text("Sign Up", style: TextStyle(fontSize: 20)),
                    ),
                    SizedBox(height: 20),
                    Text(
                      error,
                      style: TextStyle(fontSize: 15, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
