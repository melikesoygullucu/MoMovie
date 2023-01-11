import 'package:firebase_example/provider/theme_provider.dart';
import 'package:firebase_example/rating/ratingcontroller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:firebase_example/SplashScreen/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Categories/CategoryMainScreen.dart';
import 'Home/bloc/theme_bloc/theme_controller.dart';
import 'Home/bloc/theme_bloc/theme_service.dart';
import 'NavigationBarPage.dart';
import 'notification/service.dart';

void main() async {
  await GetStorage.init();
  Get.put(RatingController());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final themeController = ThemeController(ThemeService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context)=>themeProvider(ThemeData())),
      ],
      child: ChangeNotifierProvider(
        create: (context) => themeProvider(ThemeData())),
      builder: (context, child) {
        final provider = Provider.of<themeProvider>(context);
        return  MaterialApp(
          routes: {
            CategoryMainScreen.routeName: (context) => CategoryMainScreen(),
            NavBar.routeName: (context) => const NavBar()
          },
theme: provider.getTheme(),
          title: 'Flutter Demo',
          home: SplashScreen(),
        );
      },
    );
  }
}

