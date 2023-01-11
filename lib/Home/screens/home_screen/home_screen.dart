import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../bloc/theme_bloc/theme_controller.dart';
import '../../netflix/screens/main_screen.dart';
import '../../repositories/movie_repository.dart';
import '../../widgets/home_screen_widgets/now_playing_widgets/now_playing_widget.dart';
import '../../widgets/home_screen_widgets/popular_movies_widgets/popular_movies_widget.dart';
import '../../widgets/home_screen_widgets/top_rated_movies_widgets/top_rated_movies_widget.dart';
import '../../widgets/home_screen_widgets/upcoming_widgets/upcoming_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {Key? key, required this.themeController, required this.movieRepository})
      : super(key: key);

  final ThemeController themeController;
  final MovieRepository movieRepository;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            UpComingWidget(
                movieRepository: widget.movieRepository,
                themeController: widget.themeController),
            Row(
              children: [
                InkWell(
                  onTap: () => Get.off(MainScreen()),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(
                        right: 5, top: 5, bottom: 5, left: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Icon(
                          Icons.shuffle,
                          color: Colors.red,
                        ),
                        Text(
                          "Karıştır",
                          style: TextStyle(
                            color: Color.fromARGB(200, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Now Playing"),
            ),
            NowPlayingWidget(
                movieRepository: widget.movieRepository,
                themeController: widget.themeController),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Popular Movies"),
            ),
            PopularMoviesWidget(
                movieRepository: widget.movieRepository,
                themeController: widget.themeController),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("AllTime Top Rated Movies"),
            ),
            TopRatedMoviesWidget(
                movieRepository: widget.movieRepository,
                themeController: widget.themeController)
          ],
        ),
      ),
    );
  }
}
