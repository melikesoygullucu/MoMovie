import 'package:firebase_auth/firebase_auth.dart';

import 'SettingsPage.dart';
import 'package:flutter/material.dart';
import 'SideBarPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MoMovie',
      initialRoute: '/',
      routes: {
        '/': (context) => const ProfileScreen(),
        //'/tobewatch':(context)=> const ToBeWatchScreen(),
        //WatchedScreen.routeName:(context)=> const WatchedScreen(),
      },
      builder: (context, child) {
        return _MoMovie(
          navigator: (child!.key as GlobalKey<NavigatorState>),
          child: child,
        );
      },
    );
  }
}

class _MoMovie extends StatefulWidget {
  const _MoMovie({
    Key? key,
    required this.navigator,
    required this.child,
  }) : super(key: key);

  final GlobalKey<NavigatorState> navigator;
  final Widget child;

  @override
  State<_MoMovie> createState() => _MoMovieState();
}

class _MoMovieState extends State<_MoMovie> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: const Color(0xFFF5EDDC),
        body: Row(
          children: [
            SideBar(
              width: width,
              height: height,
            ),
            Expanded(
              child: widget.child,
            ),
          ],
        ));
  }
}

class ProfileScreen extends StatelessWidget {
  static var routeName;

  const ProfileScreen({Key? key}) : super(key: key);

  // static const routeName: '/profile';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: new Stack(
      children: <Widget>[
        ClipPath(
          child: Container(color: Colors.black.withOpacity(0.8)),
          clipper: getClipper(),
        ),
        Positioned(
            width: 350.0,
            top: MediaQuery.of(context).size.height / 5,
            child: Column(
              children: <Widget>[
                Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                            image: NetworkImage(''), fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(75.0)),
                        boxShadow: [
                          BoxShadow(blurRadius: 7.0, color: Colors.black)
                        ])),
                SizedBox(height: 90.0),
                Text(
                  "uid",
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
                SizedBox(height: 15.0),
                Text(
                  'About me',
                  style: TextStyle(
                      fontSize: 17.0,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Montserrat'),
                ),
                SizedBox(height: 25.0),
                Container(
                    height: 30.0,
                    width: 95.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.redAccent,
                      color: Colors.red,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Text(
                            'Edit my profile',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    )),
                SizedBox(height: 25.0),
                Container(
                    height: 30.0,
                    width: 95.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.redAccent,
                      color: Colors.red,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SettingPageUI()));
                        },
                        child: Center(
                          child: Text(
                            'Settings',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    ))
              ],
            ))
      ],
    ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
      children: <Widget>[
        ClipPath(
          child: Container(color: Colors.black.withOpacity(0.8)),
          clipper: getClipper(),
        ),
        Positioned(
            width: 350.0,
            top: MediaQuery.of(context).size.height / 5,
            child: Column(
              children: <Widget>[
                Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                            image: NetworkImage(''), fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(75.0)),
                        boxShadow: [
                          BoxShadow(blurRadius: 7.0, color: Colors.black)
                        ])),
                SizedBox(height: 90.0),
                Text(
                  'Name',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
                SizedBox(height: 15.0),
                Text(
                  'About me',
                  style: TextStyle(
                      fontSize: 17.0,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Montserrat'),
                ),
                SizedBox(height: 25.0),
                Container(
                    height: 30.0,
                    width: 95.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.redAccent,
                      color: Colors.red,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Text(
                            'Edit my profile',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    )),
                SizedBox(height: 25.0),
                Container(
                    height: 30.0,
                    width: 95.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.redAccent,
                      color: Colors.red,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Text(
                            'Log out',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    ))
              ],
            ))
      ],
    ));
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
// class SideBar extends StatefulWidget {
//   const SideBar({Key? key,
//   required this.height,
//   required this.width,
//  // required this.navigator,
//    }) : super(key: key);
//
//   final double height;
//   final double width;
//  // final GlobalKey<NavigatorState> navigator;
//
//   @override
//   State<SideBar> createState() => _SideBarState();
// }
//
// class _SideBarState extends State<SideBar> {
//   List<Map> menu =[
//     {'title': 'Profile','routeName': '/profile'},
//     {'title': 'To Be Watch','routeName': '/tobewatch'},
//     {'title': 'Watched','routeName': '/watched'},
//   ];
//
//   int sideBarIndex =0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: widget.width*0.2,
//       color: Colors.deepPurple,
//       child: Column(children: [
//         SizedBox(height: widget.height*0.05),
//
//         ListView.builder(
//             shrinkWrap: true,
//             itemCount: menu.length,
//             physics: const NeverScrollableScrollPhysics(),
//             itemBuilder: (context,index){
//               return RotatedBox(
//                    quarterTurns: 3,
//                    child: TextButton(
//                     onPressed: (){
//                       setState(() {
//                         sideBarIndex=index;
//                       });
//
//                     },
//                      style: TextButton.styleFrom(minimumSize: const Size(200,50)),
//                     child: Text(
//                 menu[index]['title'],
//                       style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                         fontWeight: (index== sideBarIndex)
//                             ?FontWeight.bold
//                             :FontWeight.normal,
//                         color: (index==sideBarIndex)
//                             ?Colors.white
//                             :Colors.white.withAlpha(200),
//                         letterSpacing: 2,
//                       ),
//                 ),
//                 ),
//               );
//             },
//         ),]
//         ),
//     );
//   }
// }
//
//
