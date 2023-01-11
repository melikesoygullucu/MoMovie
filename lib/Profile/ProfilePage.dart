import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../user.dart';
import 'SideBarPage.dart';
import 'dart:io';
import 'SettingsPage.dart';

class ProfileScreen extends StatefulWidget {
  //Home:ProfileScreen
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> userInfo() async {
    var dataUser = DataUser().userData;
    var ref = FirebaseDatabase.instance.ref("users");
    List infoUser = ref.child(dataUser).get() as List;
    String userName = infoUser[0];
  }

  String? email = FirebaseAuth.instance.currentUser!.email.toString();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white70,
          ),
          onPressed: () {}, //önceki sayfaya dönecek
        ),
        backgroundColor: Colors.black87,
        centerTitle: true,
        elevation: 0,
        title: Center(child: const Text('Profile')),
      ),
      body: Container(
          color: Colors.black,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Colors.white10,
                    Colors.black54,
                  ],
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 150,
                ),
                child: Column(children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white70, width: 2.0),
                        ),
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/avatars/avatar1.png"),
                          backgroundColor: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    email!,
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),

                  // const SizedBox(height: 90,),
                  // Text("welcome back name", style: TextStyle(color: Colors.white54,
                  // fontWeight: FontWeight.w300, fontSize: 35),
                  // ),
                  // SizedBox(height: 10,),
                  // const Text("Let's find a movie for you!",
                  //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300,color:Colors.white54),
                  // ),
                  // Column(
                  //   children: [
                  //     IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> SettingPageUI())); }, icon: const Icon(Icons.movie_filter_outlined,size: 100,color:Colors.red),
                  //     ),
                  //   ],
                  // )
                ]),
              ),
              Align(
                alignment: const Alignment(1.3, -1.1),
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white30, width: 2.0),
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: Icon(Icons.settings_sharp),
                    color: Colors.white70,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingPageUI()));
                    },
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 400),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.movie_filter_outlined,
                                size: 50, color: Colors.red),
                          ),
                          SizedBox(height: 10),
//random movie
                          const Text(
                            'Movies For you!',
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.star_rate_outlined,
                              size: 50, color: Colors.red),
                        ),
                        SizedBox(height: 10),
                        const Text(
                          'TOP 20',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        Container(
                            // child: const ProfilTasarimi(),
                            )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    ));
  }
}

// class ProfilTasarimi extends StatefulWidget {
//   const ProfilTasarimi({Key? key}) : super(key: key);
//
//   @override
//   State<ProfilTasarimi> createState() => _ProfilTasarimiState();
// }
//
// class _ProfilTasarimiState extends State<ProfilTasarimi> {
//   late File yuklenecekDosya;
//   FirebaseAuth auth = FirebaseAuth.instance;
//   // FirebaseStorage storage = FirebaseStorage.instance;
//   late String indirmeBaglantisi;
//
// }
