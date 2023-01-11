import 'package:firebase_example/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_example/SplashScreen/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Categories/CategoryMainScreen.dart';
import 'Home/bloc/theme_bloc/theme_controller.dart';
import 'Home/bloc/theme_bloc/theme_service.dart';
import 'NavigationBarPage.dart';

void main() async {
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
