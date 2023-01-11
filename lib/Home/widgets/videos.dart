import "package:flutter/material.dart";

import '../../Utils/fonts.dart';
import '../description.dart';

class Videos extends StatelessWidget {
  //const TrendingMovies({Key? key}) : super(key: key);

  final List videos;

  Videos({required this.videos});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
              text: "Top Rated Movies", color: Colors.white, size: 16.0),
          SizedBox(height: 10),
          Container(
              height: 270,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: videos.length,
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Descripton(
                                  name: videos[index]['title'],
                                  bannerurl: "https://image.tmdb.org/t/p/w500" +
                                      videos[index]['backdrop_path'],
                                  posterurl: "https://image.tmdb.org/t/p/w500" +
                                      videos[index]['poster_path'],
                                  description: videos[index]['overview'],
                                  vote:
                                      videos[index]['vote_average'].toString(),
                                  launch_on: videos[index]['release_date'])));
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
                                      videos[index]["poster_path"]),
                            )),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            child: modified_text(
                                text: videos[index]['title'] != null
                                    ? videos[index]['title']
                                    : 'Loading...',
                                color: Colors.white,
                                size: 16.0),
                          ),
                          SizedBox(
                            height: 10,
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
