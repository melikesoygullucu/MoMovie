import "package:flutter/material.dart";
import '../../Utils/fonts.dart';

import '../description.dart';

class TopRated extends StatelessWidget {
  //const TrendingMovies({Key? key}) : super(key: key);

  final List toprated;

  TopRated({required this.toprated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
              text: "Top Rated Movies", color: Colors.white, size: 23.0),
          SizedBox(height: 10),
          Container(
              height: 270,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: toprated.length,
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Descripton(
                                  name: toprated[index]['title'],
                                  bannerurl: "https://image.tmdb.org/t/p/w500" +
                                      toprated[index]['backdrop_path'],
                                  posterurl: "https://image.tmdb.org/t/p/w500" +
                                      toprated[index]['poster_path'],
                                  description: toprated[index]['overview'],
                                  vote: toprated[index]['vote_average']
                                      .toString(),
                                  launch_on: toprated[index]['release_date'])));
                    },
                    child: Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              image: DecorationImage(
                                // fit: BoxFit.fill,
                                image: NetworkImage(
                                    "https://image.tmdb.org/t/p/w500" +
                                        toprated[index]["poster_path"]),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 40,
                            child: modified_text(
                                text: toprated[index]['title'] != null
                                    ? toprated[index]['title']
                                    : 'Loading...',
                                color: Colors.white,
                                size: 16.0),
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
