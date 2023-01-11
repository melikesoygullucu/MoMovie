import 'package:flutter/material.dart';
import '../../bloc/theme_bloc/theme_controller.dart';
import '../../bloc/theme_bloc/theme_service.dart';
import '../../repositories/movie_repository.dart';
import 'home_screen.dart';

class first_screen extends StatefulWidget {
  const first_screen({Key? key}) : super(key: key);

  @override
  State<first_screen> createState() => _first_screenState();
}

class _first_screenState extends State<first_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(
          themeController: ThemeController(ThemeService()),
          movieRepository: MovieRepository()),
    );
  }
}
