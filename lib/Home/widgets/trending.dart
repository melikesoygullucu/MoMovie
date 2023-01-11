import "package:flutter/material.dart";

import '../../Utils/fonts.dart';
import '../description.dart';

class TrendingMovies extends StatelessWidget {
  //const TrendingMovies({Key? key}) : super(key: key);

  final List trending;

  TrendingMovies({required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
              text: "Trending Movies", color: Colors.white, size: 20.0),
          SizedBox(height: 10),
          Container(
              height: 270,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: trending.length,
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Descripton(
                                  name: trending[index]['title'],
                                  bannerurl: "https://image.tmdb.org/t/p/w500" +
                                      trending[index]['backdrop_path'],
                                  posterurl: "https://image.tmdb.org/t/p/w500" +
                                      trending[index]['poster_path'],
                                  description: trending[index]['overview'],
                                  vote: trending[index]['vote_average']
                                      .toString(),
                                  launch_on: trending[index]['release_date'])));
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
                                        trending[index]["poster_path"]),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 50,
                            child: modified_text(
                                text: trending[index]['title'] != null
                                    ? trending[index]['title']
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
