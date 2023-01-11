import "package:flutter/material.dart";
import 'package:firebase_example/Utils/fonts.dart';

import 'DescriptionPage.dart';

class NowPlayingMovies extends StatelessWidget {
  //const TrendingMovies({Key? key}) : super(key: key);

  final List nowplaying;

  NowPlayingMovies({required this.nowplaying});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.blueGrey.shade900,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            modified_text(text: "Now Playing", color: Colors.white, size: 20.0),
            SizedBox(height: 10),
            Container(
                height: 270,
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
                                    bannerurl:
                                        "https://image.tmdb.org/t/p/w500" +
                                            nowplaying[index]['backdrop_path'],
                                    posterurl:
                                        "https://image.tmdb.org/t/p/w500" +
                                            nowplaying[index]['poster_path'],
                                    description: nowplaying[index]['overview'],
                                    vote: nowplaying[index]['vote_average']
                                        .toString(),
                                    launch_on: nowplaying[index]
                                        ['release_date'])));
                      },
                      child: Container(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: NetworkImage(
                                    "https://image.tmdb.org/t/p/w500" +
                                        nowplaying[index]["poster_path"]),
                              )),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: modified_text(
                                  text: nowplaying[index]['title'] != null
                                      ? nowplaying[index]['title']
                                      : 'Loading...',
                                  color: Colors.white,
                                  size: 16.0),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ))
          ],
        ),
      ),
    );
  }
}
