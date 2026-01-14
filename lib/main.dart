import 'package:firebase_01/brew_crew/firebase_auth_flutter/screens/authentication/sign_in.dart';
import 'package:firebase_01/brew_crew/firebase_auth_flutter/services/auth_service.dart';
import 'package:firebase_01/brew_crew/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'brew_crew/firebase_auth_flutter/screens/wrapper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const BrewCrew());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: HomeScreen(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

/// Brew Crew App
class BrewCrew extends StatelessWidget {
  const BrewCrew({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(home: Wrapper(), debugShowCheckedModeBanner: false),
    );
  }
}
