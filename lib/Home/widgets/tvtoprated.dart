import "package:flutter/material.dart";

import '../../Utils/fonts.dart';
import '../descriptionfoTV.dart';

class TvTopRated extends StatelessWidget {
  //const TrendingMovies({Key? key}) : super(key: key);

  final List tvtoprated;

  TvTopRated({required this.tvtoprated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
              text: "Airing Today in TV", color: Colors.white, size: 20.0),
          SizedBox(height: 15),
          Container(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tvtoprated.length,
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DescriptionforTV(
                                    name: tvtoprated[index]['original_name'],
                                    bannerurl:
                                        "https://image.tmdb.org/t/p/w500" +
                                            tvtoprated[index]['backdrop_path'],
                                    description: tvtoprated[index]['overview'],
                                    vote: tvtoprated[index]['vote_average']
                                        .toString(),
                                  )));
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      width: 250,
                      child: Column(
                        children: [
                          Container(
                            width: 250,
                            height: 160,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://image.tmdb.org/t/p/w500" +
                                            tvtoprated[index]["poster_path"]),
                                    fit: BoxFit.fill)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: modified_text(
                                text: tvtoprated[index]['original_name'] != null
                                    ? tvtoprated[index]['original_name']
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
