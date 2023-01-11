import "package:flutter/material.dart";

import '../../Utils/fonts.dart';
import '../descriptionfoTV.dart';

class TV extends StatelessWidget {
  //const TrendingMovies({Key? key}) : super(key: key);

  final List tv;

  TV({required this.tv});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
              text: " Populer TV Shows", color: Colors.white, size: 20.0),
          SizedBox(height: 15),
          Container(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tv.length,
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DescriptionforTV(
                                    name: tv[index]['original_name'],
                                    bannerurl:
                                        "https://image.tmdb.org/t/p/w500" +
                                            tv[index]['backdrop_path'],
                                    description: tv[index]['overview'],
                                    vote: tv[index]['vote_average'].toString(),
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
                                            tv[index]["poster_path"]),
                                    fit: BoxFit.fill)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: modified_text(
                                text: tv[index]['original_name'] != null
                                    ? tv[index]['original_name']
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
