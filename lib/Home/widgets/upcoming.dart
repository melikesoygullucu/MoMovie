import "package:flutter/material.dart";

import '../../Utils/fonts.dart';
import '../description.dart';

class UpComing extends StatelessWidget {
  //const TrendingMovies({Key? key}) : super(key: key);

  final List upcoming;

  UpComing({required this.upcoming});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
              text: "Up Coming Movies", color: Colors.white, size: 20.0),
          SizedBox(height: 10),
          Container(
              height: 270,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: upcoming.length,
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Descripton(
                                  name: upcoming[index]['title'],
                                  bannerurl: "https://image.tmdb.org/t/p/w500" +
                                      upcoming[index]['backdrop_path'],
                                  posterurl: "https://image.tmdb.org/t/p/w500" +
                                      upcoming[index]['poster_path'],
                                  description: upcoming[index]['overview'],
                                  vote: upcoming[index]['vote_average']
                                      .toString(),
                                  launch_on: upcoming[index]['release_date'])));
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
                                        upcoming[index]["poster_path"]),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            child: modified_text(
                                text: upcoming[index]['title'] != null
                                    ? upcoming[index]['title']
                                    : 'Loading...',
                                color: Colors.white,
                                size: 13.0),
                          )
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
