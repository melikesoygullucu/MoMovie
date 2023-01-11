import 'package:firebase_example/HomePage.dart';
import 'package:firebase_example/LoginPages/LoginPage.dart';
import 'package:firebase_example/MainPage.dart';
import 'package:firebase_example/SplashScreen/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Categories/CategoryMainScreen.dart';
import 'NavigationBarPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        CategoryMainScreen.routeName: (context) => CategoryMainScreen(),
        NavBar.routeName: (context) => const NavBar()
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
