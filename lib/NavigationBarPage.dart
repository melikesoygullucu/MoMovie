import 'package:bottom_navy_bar/bottom_navy_bar.dart';

import 'package:firebase_example/Categories/CategoryMainScreen.dart';
import 'package:firebase_example/Profile/ProfilePage.dart';
import 'package:firebase_example/Profile/SideBarPage.dart';
import 'package:flutter/material.dart';

import 'Home/app.dart';
import 'Home/bloc/theme_bloc/theme_controller.dart';
import 'Home/bloc/theme_bloc/theme_service.dart';
import 'Home/repositories/movie_repository.dart';

class NavBar extends StatefulWidget {
  static const routeName = '/navbarroute';

  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;
  int _counter = 0;
  final List<Widget> screens = [
    App(
        themeController: ThemeController(ThemeService()),
        movieRepository: MovieRepository()),
    SideBar(
      height: 300,
      width: 300,
    ),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.white,
        //backgroundColor: Colors.blueGrey[900],
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
            activeColor: Colors.purpleAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.favorite),
            title: Text(
              ' Favorites',
            ),
            activeColor: Colors.pink,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
              activeColor: Colors.blue,
              textAlign: TextAlign.center,
              inactiveColor: Colors.black),
        ],
      ),
    );
  }
}
