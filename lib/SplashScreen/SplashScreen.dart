import 'dart:async';
import 'package:firebase_example/Categories/CategoryMainScreen.dart';
import 'package:firebase_example/MainPage.dart';
import 'package:firebase_example/NavigationBarPage.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 8),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainPage(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery(data: MediaQueryData(), child: MaterialApp());
    var size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/logo_splashscreen.mp4.lottie.json'),
          Text(
            "MoMovie",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            "Movie Recommender",
            style: TextStyle(fontSize: 20),
          ),
        ],
      )),
    );
  }
}
//child:
