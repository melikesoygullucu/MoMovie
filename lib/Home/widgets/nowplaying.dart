import "package:flutter/material.dart";
import '../../Utils/fonts.dart';

import '../description.dart';

class NowPlayingMovies extends StatelessWidget {
  //const TrendingMovies({Key? key}) : super(key: key);

  final List nowplaying;

  NowPlayingMovies({required this.nowplaying});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: "Now Playing", color: Colors.white, size: 20.0),
          SizedBox(height: 10),
          Container(
              height: 456,
              width: 550,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: nowplaying.length,
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Descripton(
                                  name: nowplaying[index]['title'],
                                  bannerurl: "https://image.tmdb.org/t/p/w500" +
                                      nowplaying[index]['backdrop_path'],
                                  posterurl: "https://image.tmdb.org/t/p/w500" +
                                      nowplaying[index]['poster_path'],
                                  description: nowplaying[index]['overview'],
                                  vote: nowplaying[index]['vote_average']
                                      .toString(),
                                  launch_on: nowplaying[index]
                                      ['release_date'])));
                    },
                    child: Container(
                      width: 300,
                      height: 320,
                      child: Stack(
                        children: [
                          Positioned(
                            child: Stack(children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          "https://image.tmdb.org/t/p/w500" +
                                              nowplaying[index]
                                                  ["poster_path"])),
                                ),
                                height: 500.0,
                              ),
                              Container(
                                height: 500.0,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.transparent,
                                          Colors.black87,
                                        ],
                                        stops: [
                                          0.0,
                                          1.0
                                        ])),
                              )
                            ]),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ))
        ],
      ),
    );
  }
}
