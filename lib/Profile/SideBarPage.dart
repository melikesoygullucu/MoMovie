import 'package:flutter/material.dart';

import 'ProfilePage.dart';
import 'ToBeWatchPage.dart';
import 'WatchedScreen.dart';

class SideBar extends StatefulWidget {
  const SideBar({
    Key? key,
    required this.height,
    required this.width,
    // required this.navigator,
  }) : super(key: key);

  final double height;
  final double width;
  // final GlobalKey<NavigatorState> navigator;

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  List<Map> menu = [
    {'title': 'Profile'},
    {'title': 'To Be Watch'},
    {'title': 'Watched'},
  ];

  int sideBarIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.2,
      color: Colors.deepPurple,
      child: Column(children: [
        SizedBox(height: widget.height * 0.05),
        ListView.builder(
          shrinkWrap: true,
          itemCount: menu.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return RotatedBox(
              quarterTurns: 3,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    sideBarIndex = index;
                  });
                  if (index == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileScreen()),
                    );
                  }
                  if (index == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ToBeWatchScreen()),
                    );
                  }

                  if (index == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WatchedScreen()),
                    );
                  }
                },
                style: TextButton.styleFrom(minimumSize: const Size(200, 50)),
                child: Text(
                  menu[index]['title'],
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: (index == sideBarIndex)
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: (index == sideBarIndex)
                            ? Colors.white
                            : Colors.white.withAlpha(200),
                        letterSpacing: 2,
                      ),
                ),
              ),
            );
          },
        ),
      ]),
    );
  }
}
