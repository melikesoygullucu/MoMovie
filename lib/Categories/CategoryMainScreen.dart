import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import '../NavigationBarPage.dart';
import '../Profile/ProfilePage.dart';
import '../Utils/fonts.dart';
import 'toprated.dart';
import 'nowplaying.dart';
import 'trending.dart';
import 'tv.dart';
import 'upcoming.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CategoryMainScreen extends StatefulWidget {
  static const routeName = '/category';

  const CategoryMainScreen({Key? key}) : super(key: key);

  @override
  State<CategoryMainScreen> createState() => _CategoryMainScreenState();
}

class _CategoryMainScreenState extends State<CategoryMainScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.green),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  List nowplaying = [];
  List upcoming = [];

  //List latest = [];
  List tvtoprated = [];
  final String apikey = "4e16a9c9580245c7a7ebb9b086dfeaae";
  final String readaccesstoken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ZTE2YTljOTU4MDI0NWM3YTdlYmI5YjA4NmRmZWFhZSIsInN1YiI6IjYzYTIzMjA5ZDhlMjI1MGU4YjM5M2MzNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.1zyvDmUxsI_DEiRk8-mOhgtEacyDCDPeRHtcxTEtCoo";
  var _currentIndex = 0;

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  var _index = 0;
  final List<Widget> screens = [
    const CategoryMainScreen(),
    ProfileScreen(),
    ProfileScreen(),
  ];
  int _selectedIndex = 0;
  late PageController _pageController = PageController();

  @override
  void initState1() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    CategoryMainScreen(),
    // Favorites(),
    //SearchBar(),
    //ProfilePage(),
  ];

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingresults = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresults = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresults = await tmdbWithCustomLogs.v3.tv.getPopular();
    Map nowplayingresults = await tmdbWithCustomLogs.v3.movies.getNowPlaying();
    //Map latestresults = await tmdbWithCustomLogs.v3.movies.getLatest();
    Map upcomingresults = await tmdbWithCustomLogs.v3.movies.getUpcoming();
    Map tvtopratedresults = await tmdbWithCustomLogs.v3.tv.getAiringToday();

    print(tv);
    setState(() {
      trendingmovies = trendingresults["results"];
      topratedmovies = topratedresults["results"];
      tv = tvresults["results"];
      tvtoprated = tvtopratedresults['results'];
      nowplaying = nowplayingresults["results"];
      //latest = latestresults["results"];
      upcoming = upcomingresults["results"];
    });
    //print(latest);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: modified_text(
          text: 'MoMovie Recommender 🎬 ',
          color: Colors.white,
          size: 28.0,
        ),
      ),
      body: ListView(
        children: [
          /* Card(
            elevation: 5,
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              height: 300,
              width: 400,
              // child: Image(
              //   image: AssetImage("images/banner.png"),
              //   fit: BoxFit.fill,
              // ),
            ),
          ),*/

          TopRated(toprated: topratedmovies),
          TV(tv: tv),
          TopRated(toprated: tvtoprated),
          TrendingMovies(trending: trendingmovies),
          NowPlayingMovies(nowplaying: nowplaying),
          UpComing(upcoming: upcoming),
        ],
      ),
    );
  }
}
