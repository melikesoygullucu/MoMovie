import 'package:firebase_example/Home/repositories/movie_repository.dart';
import 'package:firebase_example/Home/style/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bloc/theme_bloc/theme_controller.dart';
import 'screens/main_screen.dart';

/// The Widget that configures your application.
class App extends StatelessWidget {
  const App(
      {Key? key, required this.themeController, required this.movieRepository})
      : super(key: key);

  final ThemeController themeController;
  final MovieRepository movieRepository;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: themeController,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          //restorationScopeId: 'app',
          theme: CustomTheme.darkTheme,
          darkTheme: CustomTheme.darkTheme,

          home: FirstScreen(
            themeController: themeController,
            movieRepository: movieRepository,
          ),
        );
      },
    );
  }
}
