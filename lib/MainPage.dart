import 'package:firebase_example/LoginPages/LoginPage.dart';
import 'package:firebase_example/NavigationBarPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_example/HomePage.dart';
import 'Categories/CategoryMainScreen.dart';
import 'AuthPage.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NavBar();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}
